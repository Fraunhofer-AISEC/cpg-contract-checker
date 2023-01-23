pragma solidity ^0.4.0;

contract SomeContract{

   address public owner;

    modifier ownerOnly{
        if(msg.sender == owner) _;  
    }

    modifier ownerOnly{
        if(msg.sender != owner) revert();  
        _;
    }

   function SomeContract(){
      owner = msg.sender;
   }
}
