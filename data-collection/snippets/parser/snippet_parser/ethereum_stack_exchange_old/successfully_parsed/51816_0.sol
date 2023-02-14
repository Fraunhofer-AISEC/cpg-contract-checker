pragma solidity ^0.4.2;

contract Forwarder  {
  
  address public destinationAddress;

  
  function Forwarder() {
    destinationAddress = msg.sender;
  }

  
  function () payable {
       {
          if (!destinationAddress.send(msg.value)) throw; 
      }
}
}