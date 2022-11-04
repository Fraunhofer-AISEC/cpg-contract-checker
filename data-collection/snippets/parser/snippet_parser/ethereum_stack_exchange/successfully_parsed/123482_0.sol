function first() public payable {
  _internalFunc();
}

function _internalFunc() internal {
  require(msg.value > 0, "send more than zero");
  
}
