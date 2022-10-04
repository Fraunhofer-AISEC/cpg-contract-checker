contract ForceSender {
  function forceSend(address recipient) payable {
    require(msg.value != 0);
    ForceSend f = (new ForceSend).value(msg.value)(recipient);
    assert(address(f) != address(0));
  }
}
