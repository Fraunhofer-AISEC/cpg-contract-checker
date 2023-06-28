pragma solidity ^0.8.4;

contract Example {
  error InvalidSenderAddress(address _address);

  function foo() external {
    revert InvalidSenderAddress(msg.sender);
  }
}
