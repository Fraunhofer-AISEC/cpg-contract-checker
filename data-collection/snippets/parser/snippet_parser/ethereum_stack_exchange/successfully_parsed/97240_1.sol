pragma solidity 0.5.1;

contract chat{
   event SendMessage(string message);
   
   function sendmessage(string memory message) public returns(string memory) {
       emit SendMessage(message);
       return message;
   }
}
