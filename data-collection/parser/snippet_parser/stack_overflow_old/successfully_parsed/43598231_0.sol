pragma solidity ^0.4.6; 
contract Agreement {
   address owner;
   address seller; 
   uint amount; 

   function Agreement(address _seller,uint _amount) {
     owner = msg.sender; seller=_seller; amount=_amount;
   } 

   function send(){
    if (owner.balance < amount) throw;      
    if (seller.balance + amount < seller.balance) throw;
    if(!seller.send(amount))throw;
    } 
}
