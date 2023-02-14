  function transfer(address _to, uint256 _value) public returns (bool success){
    require(balanceOf[msg.sender] >= _value,
      "Tokens transferred must be less or equal to account balance");
    
    balanceOf[msg.sender] -= _value;
    
    balanceOf[_to] += _value - _value/200;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
