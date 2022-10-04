
pragma solidity 0.5.1;

contract EIP20Interface {
    
    
    uint256 public totalSupply;

    
    
    function balanceOf(address _owner) public view returns (uint256 balance);

    
    
    
    
    function transfer(address _to, uint256 _value) public returns (bool success);

    
    
    
    
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

    
    
    
    
    function approve(address _spender, uint256 _value) public returns (bool success);

    
    
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);

    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
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
    
    
    function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
        c = a + b;
        assert(c >= a);
        return c;
    }
}





contract Ownable {
  address public owner;


  event OwnershipRenounced(address indexed previousOwner);
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  
  constructor() public {
    owner = msg.sender;
  }

  
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

  
  function renounceOwnership() public onlyOwner {
    emit OwnershipRenounced(owner);
    owner = address(0);
  }
}


contract Pausable is Ownable {
  event Pause();
  event Unpause();
  event NotPausable();

  bool public paused = false;
  bool public canPause = true;

  
  modifier whenNotPaused() {
    require(!paused || msg.sender == owner);
    _;
  }

  
  modifier whenPaused() {
    require(paused);
    _;
  }

  
    function pause() onlyOwner whenNotPaused public {
        require(canPause == true);
        paused = true;
        emit Pause();
    }

  
  function unpause() onlyOwner whenPaused public {
    require(paused == true);
    paused = false;
    emit Unpause();
  }
  
  
    function notPausable() onlyOwner public{
        paused = false;
        canPause = false;
        emit NotPausable();
    }
}


contract ARST is EIP20Interface, Pausable {

    string public name= "THEOS ARS";
    uint8  public decimals = 6;
    string public version  = "1";
    string public symbol = "ARST";
    uint256 public constant initial_supply = 100000;


    event Transfer (address indexed _from, address indexed _to, uint256 _value);

    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    uint256 constant private MAX_UINT256 = 2**256 - 1;

    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) public {
        balances[msg.sender] = _initialAmount;               
        totalSupply = _initialAmount;                        
        name = _tokenName;                                  
        decimals = _decimalUnits;                            
        symbol = _tokenSymbol;                               
    }


    function transfer(address _to, uint256 _value) public returns (bool success) {

        require(balances[msg.sender] >= _value, "insuficient balance"); 
        balances[msg.sender] -= _value; 
        balances[_to] += _value; 
        emit Transfer(msg.sender, _to, _value); 
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value, "insuficient balance");
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); 
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); 
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
