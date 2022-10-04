contract DelegateCallee {
  event Received(address sender, uint value);
  function getData() external payable {
    emit Received(msg.sender, msg.value);
  }
}
