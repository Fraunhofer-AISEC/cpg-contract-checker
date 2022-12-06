
contract BasicToken is ERC20Basic {
  using SafeMath for uint;

  mapping(address => uint) balances;

  

  
  function transfer(address _to, uint _value) public returns (bool success) {
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

  
  function balanceOf(address _owner) public constant returns (uint balance) {
    return balances[_owner];
  }

}
