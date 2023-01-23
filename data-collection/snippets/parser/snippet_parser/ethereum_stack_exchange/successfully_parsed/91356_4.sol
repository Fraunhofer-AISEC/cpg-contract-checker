contract A {
  uint256[] public foo;

  function getFooLength() public view returns (uint256) {
    return foo.length;
  }
}

contract B {
  A a;

  function getFoo() public view returns (uint256) {
    return a.getFooLength();
  }
}
