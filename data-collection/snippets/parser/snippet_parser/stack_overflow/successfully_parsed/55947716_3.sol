
pragma solidity 0.5.4;



library SafeMath {

  
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    
    
    
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    
    
    
    return a / b;
  }

  
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}



contract MultiOwnable {
    using SafeMath for uint8;

    struct CommitteeStatusPack{
      
        uint8 numOfOwners;
        uint8 numOfVotes;
        uint8 numOfMinOwners;
        bytes proposedFuncData;
    }
    CommitteeStatusPack public committeeStatus;

    address[] public ballot; 
    mapping(address => bool) public owner;

    event Vote(address indexed proposer, bytes indexed proposedFuncData);
    event Propose(address indexed proposer, bytes indexed proposedFuncData);
    event Dismiss(address indexed proposer, bytes indexed proposedFuncData);
    event AddedOwner(address newOwner);
    event RemovedOwner(address removedOwner);
    event TransferOwnership(address from, address to);


    
    constructor(address _coOwner1, address _coOwner2, address _coOwner3, address _coOwner4, address _coOwner5) internal {
        require(_coOwner1 != address(0x0) &&
                _coOwner2 != address(0x0) &&
                _coOwner3 != address(0x0) &&
                _coOwner4 != address(0x0) &&
                _coOwner5 != address(0x0));
        require(_coOwner1 != _coOwner2 &&
                _coOwner1 != _coOwner3 &&
                _coOwner1 != _coOwner4 &&
                _coOwner1 != _coOwner5 &&
                _coOwner2 != _coOwner3 &&
                _coOwner2 != _coOwner4 &&
                _coOwner2 != _coOwner5 &&
                _coOwner3 != _coOwner4 &&
                _coOwner3 != _coOwner5 &&
                _coOwner4 != _coOwner5); 
        owner[_coOwner1] = true;
        owner[_coOwner2] = true;
        owner[_coOwner3] = true;
        owner[_coOwner4] = true;
        owner[_coOwner5] = true;
        committeeStatus.numOfOwners = 5;
        committeeStatus.numOfMinOwners = 5;
        emit AddedOwner(_coOwner1);
        emit AddedOwner(_coOwner2);
        emit AddedOwner(_coOwner3);
        emit AddedOwner(_coOwner4);
        emit AddedOwner(_coOwner5);
    }


    modifier onlyOwner() {
        require(owner[msg.sender]);
        _;
    }

    
    modifier committeeApproved() {
      
      require( keccak256(committeeStatus.proposedFuncData) == keccak256(msg.data) ); 

      
      require(committeeStatus.numOfVotes > committeeStatus.numOfOwners.div(2));
      _;
      _dismiss(); 
    }


    
    function propose(bytes memory _targetFuncData) onlyOwner public {
      
      require(committeeStatus.numOfVotes == 0);
      require(committeeStatus.proposedFuncData.length == 0);

      
      committeeStatus.proposedFuncData = _targetFuncData;
      emit Propose(msg.sender, _targetFuncData);
    }

    
    function dismiss() onlyOwner public {
      _dismiss();
    }

    

    function _dismiss() internal {
      emit Dismiss(msg.sender, committeeStatus.proposedFuncData);
      committeeStatus.numOfVotes = 0;
      committeeStatus.proposedFuncData = "";
      delete ballot;
    }


    

    function vote() onlyOwner public {
      
      uint length = ballot.length; 
      for(uint i=0; i<length; i++) 
        require(ballot[i] != msg.sender);

      
      require( committeeStatus.proposedFuncData.length != 0 );

      
      
      committeeStatus.numOfVotes++;
      ballot.push(msg.sender);
      emit Vote(msg.sender, committeeStatus.proposedFuncData);
    }


    
    function transferOwnership(address _newOwner) onlyOwner committeeApproved public {
        require( _newOwner != address(0x0) ); 
        require( owner[_newOwner] == false );
        owner[msg.sender] = false;
        owner[_newOwner] = true;
        emit TransferOwnership(msg.sender, _newOwner);
    }

    
    function addOwner(address _newOwner) onlyOwner committeeApproved public {
        require( _newOwner != address(0x0) );
        require( owner[_newOwner] != true );
        owner[_newOwner] = true;
        committeeStatus.numOfOwners++;
        emit AddedOwner(_newOwner);
    }

    
    function removeOwner(address _toRemove) onlyOwner committeeApproved public {
        require( _toRemove != address(0x0) );
        require( owner[_toRemove] == true );
        require( committeeStatus.numOfOwners > committeeStatus.numOfMinOwners ); 
        owner[_toRemove] = false;
        committeeStatus.numOfOwners--;
        emit RemovedOwner(_toRemove);
    }
}

contract Pausable is MultiOwnable {
    event Pause();
    event Unpause();

    bool internal paused;

    modifier whenNotPaused() {
        require(!paused);
        _;
    }

    modifier whenPaused() {
        require(paused);
        _;
    }

    modifier noReentrancy() {
        require(!paused);
        paused = true;
        _;
        paused = false;
    }

    
    function pause() public onlyOwner committeeApproved whenNotPaused {
        paused = true;
        emit Pause();
    }

    function unpause() public onlyOwner committeeApproved whenPaused {
        paused = false;
        emit Unpause();
    }
}


contract RunningContractManager is Pausable {
    address public implementation; 

    event Upgraded(address indexed newContract);

    function upgrade(address _newAddr) onlyOwner committeeApproved external {
        require(implementation != _newAddr);
        implementation = _newAddr;
        emit Upgraded(_newAddr); 
    }

    
}






contract NemodaxStorage is RunningContractManager {

    
    
    string public name;
    string public symbol;
    uint8 public decimals = 18;    
    uint256 public totalSupply;

    
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;
    mapping (address => bool) public frozenExpired; 

    bool private initialized;

    uint256 public tokenPerEth;
    bool public opened = true;
}



contract ProxyNemodax is NemodaxStorage {

    
    constructor(address _coOwner1,
                address _coOwner2,
                address _coOwner3,
                address _coOwner4,
                address _coOwner5)
        MultiOwnable( _coOwner1, _coOwner2, _coOwner3, _coOwner4, _coOwner5) public {}

    function () payable external {
        address localImpl = implementation;
        require(localImpl != address(0x0));

        assembly {
            let ptr := mload(0x40)

            switch calldatasize
            case 0 {  } 

            default{
                calldatacopy(ptr, 0, calldatasize)

                let result := delegatecall(gas, localImpl, ptr, calldatasize, 0, 0)
                let size := returndatasize
                returndatacopy(ptr, 0, size)
                switch result

                case 0 { revert(ptr, size) }
                default { return(ptr, size) }
            }
        }
    }
}

