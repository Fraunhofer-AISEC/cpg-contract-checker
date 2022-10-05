pragma solidity 0.5.1;

contract chat{
   event sendmessage(string message);
   function sendmessage(string message) view public returns(string message, memory) {
       emit sendmessage(message);
       return message;
   }
}
