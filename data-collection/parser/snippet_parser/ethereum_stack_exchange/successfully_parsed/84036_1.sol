
pragma solidity ^0.6.9;

import "./Foo.sol";

abstract contract Bar is Foo {
  function doStuff() external override pure returns(string memory) {
    return "do stuff from Bar.sol";
  }
}
