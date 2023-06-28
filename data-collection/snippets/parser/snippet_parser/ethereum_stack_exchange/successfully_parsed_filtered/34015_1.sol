contract Test {

  event LogTest(address sender, address toWhom, uint amount);

  function test(address whom, uint256 amount) public returns(bool success) {
    LogTest(msg.sender, whom, amount);
    return true;
  }
}
