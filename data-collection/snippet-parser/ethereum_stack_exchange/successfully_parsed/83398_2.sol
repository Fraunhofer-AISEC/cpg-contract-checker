pragma solidity ^0.6.6;

contract Test {
   address creator;

   constructor() public{
       creator = msg.sender;
   }
}
