
pragma solidity ^0.8.9;

contract FooLauncher {
  function launchFoo(uint _foo_id, uint _uint_1, uint _uint_2) public {}
}
contract Foo {
  function addOne() public {}
}

contract Factory {
  mapping(uint => Foo) public foos;
  uint next_foo_id;
  FooLauncher foo_launcher;

  function addFoo(uint _uint_1, uint _uint_2) public {
    foo_launcher.launchFoo(next_foo_id, _uint_1, _uint_2);
    next_foo_id += 1;

  }

  function addFooAddress(uint _foo_id, Foo _foo_address) {
    foos[_foo_id] = _foo_address;
  }

  function addOneInFoo(uint _foo_id) public {
    Foo foo = foos[_foo_id];
    foo.addOne();
  }
}
