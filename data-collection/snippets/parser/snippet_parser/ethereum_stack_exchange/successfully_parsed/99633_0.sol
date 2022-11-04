contract Foo {
  function foo() public returns (bytes memory) {
    return bytes("");
  }
  
  function bar() public returns (bool) {
    return foo().length == 0;
  }
}
