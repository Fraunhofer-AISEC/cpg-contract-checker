pragma solidity ^0.4.20; 

contract Contract {

  function deposit(bytes32 _id) payable {
     LogJob(msg.sender);
  }
  event LogJob(address indexed _from);
}
