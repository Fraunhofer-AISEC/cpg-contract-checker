pragma solidity ^0.8.4;

contract Example {
  function foo() external {
    revert("Invalid sender address");
  }
}
