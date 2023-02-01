pragma solidity >=0.4.26;

contract Inbox {
    string public message;

    constructor(string memory intialmsg) public{
        message = intialmsg;
    }

    function setmessage(string memory newMessage) public {
        message = newMessage;
    }
}
