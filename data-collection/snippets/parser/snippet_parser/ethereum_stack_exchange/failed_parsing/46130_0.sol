
  
  
  
  
  
  function transfer(address _from, address _to, uint256 _value, string Pl_value) public returns (bool) {
    require(_to != address(0));

    
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);

    Payload[_to] = Pl_value;

    return true;
  }

}
