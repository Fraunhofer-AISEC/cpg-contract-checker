contract B is A {
  function doSomething(uint256, uint256 b) override external returns (uint256 c) {
    c = b;
  }
}
