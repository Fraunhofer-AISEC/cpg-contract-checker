
pragma solidity ^0.8.9;

contract Inbox {
    string public message;

    function myInbox(string memory initialMessage) public {
        message = initialMessage;
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

    function getMessage() public view returns (string memory) {
        return message; 
    }
}
