contract F {
  function createChildContract() public returns (address child) {
    child = address(new C());
  }
}

contract C { }
