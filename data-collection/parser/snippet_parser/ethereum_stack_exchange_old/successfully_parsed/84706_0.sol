 
 pragma solidity >=0.4.21 <0.7.0;
 
 contract ContractBalanceTest {
     address public owner;
 
     constructor() public payable {
         owner = msg.sender;
     }
 
     modifier onlyOwner () {
       require(msg.sender == owner, "This can only be called by the contract owner!");
       _;
     }
 
     function deposit() payable public {
     }
 
     function depositAmount(uint256 amount) payable public {
         require(msg.value == amount);
     }
 
 
     function withdraw() payable onlyOwner public {
         msg.sender.transfer(address(this).balance);
     }
 
     function withdrawAmount(uint256 amount) onlyOwner payable public {
         require(msg.value == amount);
         require(amount <= getBalance());
         msg.sender.transfer(amount); 
         
     }
 
 
     function getBalance() public view returns (uint256) {
         return address(this).balance;
     }
 }

