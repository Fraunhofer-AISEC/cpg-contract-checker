pragma solidity 0.4.23;

contract Balances {
  using SafeMath for uint256;

  address owner;

  mapping (address => uint) public balances;
  mapping (address => bool) public admins;

  event AdminAdded(address adminAddress);
  event AdminRemoved(address adminAddress);
  event SetOwner(address previousOwner, address newOwner);
  event Deposit(address user, uint256 amount, uint256 userBalance);
  event Withdraw(address user, uint256 amount, uint256 userBalance);
  event AddToAddressBalance(address user, uint256 amount, uint256 userBalance);

  constructor () public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  modifier onlyAdmin {
    require(admins[msg.sender] == true);
    _;
  }

  function setOwner(address _newOwner) public onlyOwner {
    emit SetOwner(owner, _newOwner);
    owner = _newOwner;
  }

  function getOwner() public constant returns (address) {
    return owner;
  }

  function isAdmin(address _address) public constant returns (bool) {
    return admins[_address];
  }

  function isOwner(address _address) public constant returns (bool) {
      return _address == owner;
  }

  function isAdminOrOwner(address _address) public constant returns (bool) {
      return admins[_address] == true || _address == owner;
  }

  function setAdmin(address _adminAddress, bool _isAdmin) public onlyOwner {
    admins[_adminAddress] = _isAdmin;

    if (_isAdmin == true) {
      emit AdminAdded(_adminAddress);
    } else {
      emit AdminRemoved(_adminAddress);
    }
  }

  function deposit() public payable {
    require(msg.value > 0, "Msg.value was not provided or was not greater than zero.");

    balances[msg.sender] = balances[msg.sender].add(msg.value);

    emit Deposit(msg.sender, msg.value, balances[msg.sender]);
  }

  function withdraw(uint _amount) public {
    require(_amount > 0, "Amount was not provided or was not greater than zero.");
    require(_amount <= balances[msg.sender], "Amount provided is greater than balances[msg.sender].");

    balances[msg.sender] = balances[msg.sender].sub(_amount);

    msg.sender.transfer(_amount);

    emit Withdraw(msg.sender, _amount, balances[msg.sender]);
  }

  function addToAddressBalance(address _address, uint _amount) external onlyOwner onlyAdmin {
    require(_amount > 0, "Amount was not provided or was not greater than zero.");

    balances[_address] = balances[_address].add(_amount);

    emit AddToAddressBalance(_address, _amount, balances[_address]);
  }

  function balanceOf(address _address) public constant returns(uint) {
    return balances[_address];
  }
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}
