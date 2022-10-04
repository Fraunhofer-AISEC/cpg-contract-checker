pragma solidity ^0.8.7;

contract DonateContract {

  address payable public owner;
   
  
  constructor() {
    owner = payable(msg.sender);
  }

  
  function donate() public payable {
    (bool success,) = owner.call{value: 10000 wei}("");
    require(success, "Failed to send money");
  }
}
