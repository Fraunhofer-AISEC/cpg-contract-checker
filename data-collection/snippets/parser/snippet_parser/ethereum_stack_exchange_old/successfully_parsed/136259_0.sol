
pragma solidity ^0.8.7 ;

contract Variables {
   
   uint public pubInt = 25;
   bool public truth = false;
   string public msg = "Hello World";

   function dosomething() public{
       uint8 v = 30;
       address sender = msg.sender;
   }

}

