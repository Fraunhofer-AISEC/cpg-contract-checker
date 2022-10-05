"TypeError: No matching declaration found after argument-dependent lookup. require(_spender.call.value(msg.value)(_data));
^-----^ "

function approveAndCall(address payable _spender, uint256 _value, bytes memory _data) public payable returns (bool) {    
  require(_spender != address(this));   
  this.approve(_spender, _value);    
  require(_spender.call.value(msg.value)(_data));    
  return true;   
}
