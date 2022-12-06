contract A {
  uint public createdTimestamp;
  function A() {
    createdTimestamp = block.timestamp;
  }
}
