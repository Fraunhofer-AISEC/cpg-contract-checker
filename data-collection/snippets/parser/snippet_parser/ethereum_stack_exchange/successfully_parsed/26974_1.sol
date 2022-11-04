contract Thing {

  event LogSomethingHappened(address sender, uint amount);

  function doSomething(uint qty) public returns(bool success) {
    LogSomethingHappened(msg.sender, qty);
    return true;
  }
}
