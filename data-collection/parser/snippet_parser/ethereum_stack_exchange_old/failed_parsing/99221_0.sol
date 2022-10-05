contract A {
  function foo() external {
    return true;
  }
}

contract B is A {
  foo();
}
