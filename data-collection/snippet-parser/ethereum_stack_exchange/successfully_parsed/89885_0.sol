
pragma solidity ^0.7.0;

contract Foo {
  struct UnusedStruct {
    uint256 unusedProperty;
  }

  function someFunction(uint256 foo) external pure {
    foo;
  }
}
