pragma solidity ^0.5.8;

contract Hello {
   uint public message;
   constructor() public {
   message = 123456;
   }

   function get() public view returns (uint) {
   return message;
   }

   function set(uint inpStr) public{
   message = inpStr;
   }
}
