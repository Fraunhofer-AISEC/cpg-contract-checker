contract A {

  bytes32 public something;

  function setSomething(bytes32 newThing) public {
    something = newThing;
  }
}
