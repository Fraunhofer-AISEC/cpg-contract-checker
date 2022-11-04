pragma solidity ^0.4.11;

import "./Token.sol";

contract Relay is Token {

  uint256 public approvalCount;
  function Relay() {
    
  }


  modifier onlyOwner {
    if (msg.sender != owner) revert();
    _;
  }


  function approveTransaction() {
    approvalCount += 1;

    if (approvalCount == 3) {

      mint(msg.sender, 1);
      kill();
    }
  }

  function kill() onlyOwner() {
    selfdestruct(owner);
  }

}
