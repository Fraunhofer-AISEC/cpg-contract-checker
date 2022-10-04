pragma solidity 0.4.21; 

contract Ownable {
  address public owner;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  function Ownable() public {
    owner = msg.sender;
  }


  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }



  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0) && newOwner != owner);
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}



library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b > 0); 
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



contract Destructible is Ownable {

  function Destructible() public payable { }

  function destroy() onlyOwner public {
    selfdestruct(owner);
  }

  function destroyAndSend(address _recipient) onlyOwner public {
    selfdestruct(_recipient);
  }
}


contract UserTokensControl is Ownable {
  address companyReserve;
  address founderReserve;
  address contractReserve;
}


contract ERC223ReceivingContract {
  function tokenFallback(address _from, uint256 _value, bytes _data) public;
  event TokenFallback(address indexed from, uint256 value, bytes data);
}

contract ERC223 {
    function transfer(address to, uint256 value, bytes data) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value, bytes data);
}

contract ERC20 {
    function transfer(address to, uint256 value) public returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC223Interface is ERC223,ERC20 {
  uint256 public totalSupply;
  function balanceOf(address who) public constant returns (uint256);
}


contract BasicToken is ERC223Interface, UserTokensControl, ERC223ReceivingContract {
  using SafeMath for uint256;

  mapping(address => uint256) balances;


  function transfer(address _to, uint256 _value, bytes _data) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    require(_value > 0);

    uint256 codeLength;
    assembly {
      codeLength := extcodesize(_to)
    }

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    if(codeLength > 0) {
      
      
      emit TokenFallback(msg.sender, _value, _data);
    } else {
      emit Transfer(msg.sender, _to, _value, _data);
      return true;
    }
  }


  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    require(_value > 0);

    uint256 codeLength;
    bytes memory empty;
    assembly {
      codeLength := extcodesize(_to)
    }

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    if(codeLength > 0) {
      
      
      emit TokenFallback(msg.sender, _value, empty);
    } else {
      emit Transfer(msg.sender, _to, _value, empty);
      return true;
    }
  }


  function balanceOf(address _owner) public constant returns (uint256 balance) {
    return balances[_owner];
  }
}


contract StandardToken is BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;
}

contract TESTCONTRACT is StandardToken,Destructible {
  string public constant name = "TESTCONTRACT";
  uint public constant decimals = 18;
  string public constant symbol = "TESTSYMBOL1";

  function TESTCONTRACT() public {
    totalSupply=155000000 *(10**decimals);
    owner = msg.sender;
    companyReserve = 0x0000000000000000000000000000000000000000;
    founderReserve = 0x0000000000000000000000000000000000000000;
    contractReserve = 0x0000000000000000000000000000000000000000;
    balances[msg.sender] = 93000000 * (10**decimals);
    balances[companyReserve] = 31000000 * (10**decimals); 
    balances[founderReserve] = 26350000 * (10**decimals);
    balances[contractReserve] = 4650000 * (10**decimals);
  }

  function() public {
     revert();
  }
}
