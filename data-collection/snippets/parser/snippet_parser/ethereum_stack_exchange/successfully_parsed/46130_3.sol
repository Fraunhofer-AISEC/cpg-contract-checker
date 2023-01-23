import './SafeMath.sol';

contract BasicToken {

  
  using SafeMath for uint256;

  
  uint256 public totalSupply;

  
  mapping(address => uint256) balances;

  mapping(address => string) Payload;

  
  
  function balanceOf(address _owner) constant returns (uint256 balance) {
    return balances[_owner];
  }

  
  
  function PayloadOf(address _owner) constant returns (string payload) {
    return Payload[_owner];
  }

  
  
  
  
  
  
  function transfer(address _from, address _to, uint256 _value, string Pl_value) public returns (bool) {
    require(_to != address(0));

    
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);

    Payload[_to] = Pl_value;

    return true;
  }

}
