
library Math {
  function and(bool a, bool b) returns (bool c) {
    return a && b;
  }
}

contract A {
  function testTrue() returns(bool){
    return Math.and(true, true);
  }
}
