contract SampleToken {

  
  function transfer(address _to, uint256 _value) {
    if (balanceOf[msg.sender] < _value) throw;           
    if (balanceOf[_to] + _value < balanceOf[_to]) throw; 
    balanceOf[msg.sender] -= _value;                     
    balanceOf[_to] += _value;                            
    Transfer(msg.sender, _to, _value);                   
  }

}

contract LockContract { 

  function lockTokens(uint256 _period, uint256 _amount)
  external
  returns (bool) { 
    require (sampleToken.transferFrom(msg.sender, this, _amount));    
    return true;
}

  function unlockTokens(uint256 _amountLocked) 
  external
  returns (bool) {
    sampleToken.transfer(msg.sender, _amountLocked);     
    return true;
  }

}
