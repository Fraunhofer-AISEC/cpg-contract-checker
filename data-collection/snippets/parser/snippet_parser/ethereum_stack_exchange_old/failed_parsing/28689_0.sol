library Helper {
  function add(uint x, uint y) internal constant returns (uint) {
    return x + y;
  }
}

contract C {
  function doSomething(uint x, uint y) public returns (uint) {
    return Helper.add(uint x, uint y);
  }
}
