contract Token {

  using SafeMath for uint256;

  function transfer(address _to, uint256 _value) returns (bool) {
      var test = msg.sender; 
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }

}
