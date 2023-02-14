

pragma solidity >=0.8.8 <0.9.0;
contract test{
    
 address owner;

 constructor(){
   owner==msg.sender;  
 }

 modifier onleyowner{
   require (owner==msg.sender,"only owner");
   _;
 }

 modifier _4weeks {
   require(block.timestamp > 30 days,"its not 4week") ;
   _;
 }

 function hazfe()public returns(address) {
   delete owner;
   return owner;
 }
}
