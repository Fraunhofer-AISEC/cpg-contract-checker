pragma solidity ^0.6.10;
   contract HelloWorld {
   uint256 public counter = 5;
  
   function add() public {  
       counter++;
   }
 
   function subtract() public { 
       counter--;
   }
   
   function getCounter() public view returns (uint256) {
       return counter;
   }
}
