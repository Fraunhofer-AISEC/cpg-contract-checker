interface A {
  function doSomething (uint256 a, uint256 b) external returns (uint256);
}

contract B is A {
  function doSomething(uint256, uint256 b) override external returns (uint256) {
    return b;
  }
}
