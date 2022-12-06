
pragma solidity ^0.6.9;

contract Foo {
  function doStuff() external virtual pure returns(string memory) {
    return "do stuff";
  }

  function doMoreStuff() external virtual pure returns(string memory) {
    return "do more stuff";
  }
}
