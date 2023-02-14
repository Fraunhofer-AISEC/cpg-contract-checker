pragma solidity ^0.8.4;

  function payFees() public payable {
    require(msg.value >= 5 * 10**17);
    (bool success,) = owner.call{value: msg.value}("");
    require(success, "Failed to send money");
  }
