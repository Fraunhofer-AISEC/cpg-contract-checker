
pragma solidity ^0.8.9;

import "./Foo.sol";

contract Factory {
  mapping(uint => Foo) public foos;
  uint next_foo_id;

  function addFoo(uint _uint_1, uint _uint_2) public {
    Foo foo = new Foo(_uint_1, _uint_2);
    foos[next_foo_id] = foo;
    next_foo_id += 1;
  }
  function addOneInFoo(uint _foo_id) public {
    Foo foo = foos[_foo_id];
    foo.addOne();
  }
}
