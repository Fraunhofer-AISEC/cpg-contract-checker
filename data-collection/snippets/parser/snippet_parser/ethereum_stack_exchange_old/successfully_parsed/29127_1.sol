contract StandardToken is Token {

  function transfer(address _to, uint256 _value) returns (bool success) {
    
    
    
    if (balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]) {
    
      balances[msg.sender] -= _value;
      balances[_to] += _value;
      Transfer(msg.sender, _to, _value);
      return true;
    } else { return false; }
  }
}