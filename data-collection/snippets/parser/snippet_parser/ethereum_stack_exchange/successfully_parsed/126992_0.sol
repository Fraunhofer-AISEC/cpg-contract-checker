contract A {
  address[] public functionCaller;

  function test() external {
    functionCaller.push(msg.sender);
  }
}
