contract Foo {
  function returnContract() returns (SomeContract) {
    SomeContract sc = new SomeContract();
    return sc;
  }

  function returnAddress() returns (address) {
    SomeContract sc = new SomeContract();
    return address(sc);
  }
}
