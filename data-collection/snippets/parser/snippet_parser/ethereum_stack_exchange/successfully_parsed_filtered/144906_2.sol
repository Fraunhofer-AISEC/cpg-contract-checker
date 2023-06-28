
pragma solidity ^0.8.9;
import "./Foo.sol";

contract Factory {
  function addFooAddress(uint _foo_id, Foo _foo_address) {}
}

contract FooLauncher {
  Factory factory_address;

  constructor(address _factory_address) {
    factory_address = Factory(_factory_address);
  }
  function launchFoo(uint _foo_id, uint _uint_1, uint _uint_2) public {
    Foo foo = new Foo(_uint_1, _uint_2);
    factory_address.addFooAddress(_foo_id, foo);
  }
}
