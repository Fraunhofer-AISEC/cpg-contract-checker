contract Foo {
  uint x;

  function bar(uint y) constant {
    x = y;
  }
}
