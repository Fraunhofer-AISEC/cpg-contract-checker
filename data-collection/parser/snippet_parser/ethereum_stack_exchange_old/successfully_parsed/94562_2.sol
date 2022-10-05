contract Foo {

  using Math for unit; 

  function adder(uint x, uint y) public pure returns(uint sum) {
    sum = x.safeAdd(y);
  }

}
