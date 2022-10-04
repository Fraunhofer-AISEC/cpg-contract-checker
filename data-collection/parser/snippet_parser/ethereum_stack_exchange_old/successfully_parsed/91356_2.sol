contract A {
  uint256 public foo = 1;
}

contract B {
  A a;

  function getFoo() public view returns (uint256) {
    return a.foo();
  }
}
