pragma solidity ^0.4.23;

library PeopleInterface {
    struct Person {
      string name;
      string email;
      string company;
      string avatar;
      address wallet;
      address[] groups;
      mapping (address => bytes32[]) personBounties; 
    }

    struct People {
      mapping (address => Person) people;
    }

    function registerUser(People storage _people, string _name, string _email, string _company, string _avatar, address _sender) external;
    function updateUser(People storage _people, string _name, string _email, string _company, string _avatar, address _sender) external;
    function getUser(People storage _people, address _address) external view returns (string, string, string, string, address, address[]);
    function addGroup(People storage _people, address _group, address _sender) external;
    function leaveGroup(People storage _people, address _group, address _sender) external;
    function addBounty(People storage _people, address _group, bytes32 _index, address _sender) external;
    function getUserBountiesByGroup(People storage _people, address _group, address _sender) external view returns (bytes32 []);
}

library PeopleLib {

  event logRegistered(address indexed _wallet, string _name, string _email, string _company);
  event logUpdateProfile(address indexed _wallet, string _email, string _name, string _company, string _avatar);

  function registerUser (PeopleInterface.People storage _people, string _name, string _email, string _company, string _avatar, address _sender) external {
      _people.people[_sender].name = _name;
      _people.people[_sender].email = _email;
      _people.people[_sender].company = _company;
      _people.people[_sender].avatar = _avatar;
      _people.people[_sender].wallet = _sender;
      emit logRegistered(_sender, _name, _email, _company);
  }

  function updateUser (PeopleInterface.People storage _people, string _name, string _email, string _company, string _avatar, address _sender) external {
    _updateName(_people, _name, _sender);
    _updateEmail(_people, _email, _sender);
    _updateCompany(_people, _company, _sender);
    _updateAvatar(_people, _avatar, _sender);
     emit logUpdateProfile(_sender, _email, _name, _company, _avatar);
  }

  function _updateName (PeopleInterface.People storage _people, string _name, address _sender) public {
    bytes memory name = bytes(_name);
    if (name.length > 0) _people.people[_sender].name = _name;
  }

  function _updateEmail (PeopleInterface.People storage _people, string _email, address _sender) public {
    bytes memory email = bytes(_email);
    if (email.length > 0) _people.people[_sender].email = _email;
  }

  function _updateCompany (PeopleInterface.People storage _people, string _company, address _sender) public {
      bytes memory company = bytes(_company);
      if (company.length > 0) _people.people[_sender].company = _company;
  }

  function _updateAvatar (PeopleInterface.People storage _people, string _avatar, address _sender) public {
      bytes memory avatar = bytes(_avatar);
      if (avatar.length > 0) _people.people[_sender].avatar = _avatar;
  }

  function getUser (PeopleInterface.People storage _people, address _address) external view returns (string, string, string, string, address, address[]) {
      address[] memory _groups = _getGroups(_people, _address);
      return (_people.people[_address].name, _people.people[_address].email, _people.people[_address].company, _people.people[_address].avatar, _address, _groups);
  }

  function _getGroups(PeopleInterface.People storage _people, address _address) public view returns (address[]) {
    return _people.people[_address].groups;
  }

  function addGroup (PeopleInterface.People storage _people, address _group, address _sender) external {
      _people.people[_sender].groups.push(_group);
  }

  function leaveGroup (PeopleInterface.People storage _people, address _group, address _sender) external {
    for (uint i = 0; i < _people.people[_sender].groups.length; i ++) {
      if ( _group == _people.people[_sender].groups[i] ) {
        _people.people[_sender].groups = _deleteAddress(_people.people[_sender].groups, i);
      }
    }
  }

  function _deleteAddress(address[] _array, uint _index) public pure returns (address[]) {
    address[] memory arrayNew = new address[](_array.length-1);
    assert(_index < _array.length);
    for (uint i = 0; i<_array.length-1; i++){
      if(i != _index && i<_index){
        arrayNew[i] = _array[i];
      } else {
        arrayNew[i] = _array[i+1];
      }
    }
    delete _array;
    return arrayNew;
  }

  function addBounty (PeopleInterface.People storage _people, address _group, bytes32 _index, address _sender) external {
    _people.people[_sender].personBounties[_group].push(_index);
  }

  function getUserBountiesByGroup (PeopleInterface.People storage _people, address _group, address _sender) external view returns (bytes32 []) {
    return _people.people[_sender].personBounties[_group];
  }
}

contract People {
  using PeopleInterface for PeopleInterface.People;
  PeopleInterface.People people;

  event logRegistered(address indexed _wallet, string _name, string _email, string _company);
  event logUpdateProfile(address indexed _wallet, string _email, string _name, string _company, string _avatar);

  function registerUser(string _name, string _email, string _company, string _avatar, address _sender) external   {
    return people.registerUser(_name, _email, _company, _avatar, _sender);
  }

  function updateUser(string _name, string _email, string _company, string _avatar, address _sender) external   {
    return people.updateUser(_name, _email, _company, _avatar, _sender);
  }

  function getUser(address _wallet) external view returns (string, string, string, string, address, address[]) {
    return people.getUser(_wallet);
  }

  function addGroup(address _group, address _sender) external   {
    return people.addGroup(_group, _sender);
  }

  function leaveGroup(address _group, address _sender) external   {
    return people.leaveGroup(_group, _sender);
  }

  function addBounty(address _group, bytes32 _index, address _sender) external {
    return people.addBounty(_group, _index, _sender);
  }
}

pragma solidity ^0.4.23;


contract Proxy {
  
  function implementation() public view returns (address);

  
  function () payable public {
    address _impl = implementation();
    require(_impl != address(0));

    assembly {
      let ptr := mload(0x40)
      calldatacopy(ptr, 0, calldatasize)
      let result := delegatecall(gas, _impl, ptr, calldatasize, 0, 0)
      let size := returndatasize
      returndatacopy(ptr, 0, size)

      switch result
      case 0 { revert(ptr, size) }
      default { return(ptr, size) }
    }
  }
}

contract UpgradeabilityProxy is Proxy {
  
  event Upgraded(address indexed implementation);

  
  bytes32 private constant implementationPosition = keccak256("org.zeppelinos.proxy.implementation");

  
  function UpgradeabilityProxy() public {}

  
  function implementation() public view returns (address impl) {
    bytes32 position = implementationPosition;
    assembly {
      impl := sload(position)
    }
  }

  
  function setImplementation(address newImplementation) internal {
    bytes32 position = implementationPosition;
    assembly {
      sstore(position, newImplementation)
    }
  }

  
  function _upgradeTo(address newImplementation) internal {
    address currentImplementation = implementation();
    require(currentImplementation != newImplementation);
    setImplementation(newImplementation);
    emit Upgraded(newImplementation);
  }
}

contract OwnedUpgradeabilityProxy is UpgradeabilityProxy {
  
  event ProxyOwnershipTransferred(address previousOwner, address newOwner);

  
  bytes32 private constant proxyOwnerPosition = keccak256("org.zeppelinos.proxy.owner");

  
  function OwnedUpgradeabilityProxy() public {
    setUpgradeabilityOwner(msg.sender);
  }

  
  modifier onlyProxyOwner() {
    require(msg.sender == proxyOwner());
    _;
  }

  
  function proxyOwner() public view returns (address owner) {
    bytes32 position = proxyOwnerPosition;
    assembly {
      owner := sload(position)
    }
  }

  
  function setUpgradeabilityOwner(address newProxyOwner) internal {
    bytes32 position = proxyOwnerPosition;
    assembly {
      sstore(position, newProxyOwner)
    }
  }

  
  function transferProxyOwnership(address newOwner) public onlyProxyOwner {
    require(newOwner != address(0));
    emit ProxyOwnershipTransferred(proxyOwner(), newOwner);
    setUpgradeabilityOwner(newOwner);
  }

  
  function upgradeTo(address implementation) public onlyProxyOwner {
    _upgradeTo(implementation);
  }

  
  function upgradeToAndCall(address implementation, bytes data) payable public onlyProxyOwner {
    upgradeTo(implementation);
    require(this.call.value(msg.value)(data));
  }
}
