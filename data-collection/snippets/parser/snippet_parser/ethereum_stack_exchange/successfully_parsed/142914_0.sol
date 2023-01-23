receive() payable external {
  require(msg.value > 0, "not enough value received");
  (bool success, ) = msg.sender.call{value:msg.value*2}("");
  require(success)
}
