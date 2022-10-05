pragma solidity ^0.4.23;

contract One{ 
   function One(){
   }
}
contract Two {
   One one;

   constructor(address _contractAddress) public {
      one = One(_contractAddress);
   }
}
