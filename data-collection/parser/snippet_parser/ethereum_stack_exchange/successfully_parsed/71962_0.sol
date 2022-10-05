contract Test {

  function test() public pure {
    require(1 != 2, "1 is 2");
    require(2 != 3, "2 is 3");
  }
}
