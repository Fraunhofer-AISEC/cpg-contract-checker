contract A {
  event created(uint timestamp);
  function A() {
    created(block.timestamp);
  }
}
