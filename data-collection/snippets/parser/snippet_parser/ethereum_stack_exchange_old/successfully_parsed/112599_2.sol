pragma solidity ^0.4.7;

contract Inbox {
    string public message;
    
    function Inbox(string inititialMessage) public {
        message = inititialMessage;
    }
    
    function setMessage (string newMessage) public {
        message = newMessage;
        
    }
    
}
