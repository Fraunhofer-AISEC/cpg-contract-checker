contractB {
  uint private etherReceived = 0;

  function () external payable {
    etherReceived += msg.value;
  }
}
