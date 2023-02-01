pragma solidity ^0.4.18;


contract Forwarder {
  
  address public destinationAddress;

  
  function Forwarder() public {
    destinationAddress = msg.sender;
  }

  
  function() payable public {
        destinationAddress.transfer(msg.value);
  }

  
  function flush() public {
    destinationAddress.transfer(this.balance);
  }

}
