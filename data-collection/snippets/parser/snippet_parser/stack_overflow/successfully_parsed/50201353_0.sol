pragma solidity ^0.4.18; 

contract Greetings{ 
  string public message; 

  function Greetings(string initialMessage) public{ 
    message = initialMessage;
  }  

  function setMessage(string newMessage) public {
    message = newMessage;
  }  
}
