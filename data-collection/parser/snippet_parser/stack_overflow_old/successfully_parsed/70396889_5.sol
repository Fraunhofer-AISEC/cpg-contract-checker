pragma solidity ^0.8.4;

  function payFees() public payable {
    require(msg.value >= 0.5 ether);
    (bool success,) = owner.call{value: msg.value}("");
    require(success, "Failed to send money");
  }
