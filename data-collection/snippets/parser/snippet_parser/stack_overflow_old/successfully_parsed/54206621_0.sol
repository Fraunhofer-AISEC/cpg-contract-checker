pragma solidity ^0.5.3;

contract Inbox {

    string public message;

    function Inbox(string initialMessage) public {
         message = initialMessage;
    }

    function setMessage(string newMessage) public {
         message = newMessage;
    }

    function getMessage() public view returns (string) {
         return getMessage;
    }

}
