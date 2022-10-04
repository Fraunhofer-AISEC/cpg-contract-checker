pragma solidity >=0.6.12;

contract Inbox {
    string public message;

    function initialInbox(string memory initialMessage) public {
        message = initialMessage;
    }

    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
}
