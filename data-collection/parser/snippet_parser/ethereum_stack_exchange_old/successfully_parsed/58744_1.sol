pragma solidity ^0.4.17;

contract Inbox {
    string public message;

    event NewMessage(string _message, uint _block, uint _timestamp, address _user);

    function Inbox (string initialMessage) public {
        message = initialMessage;
        emit NewMessage(initialMessage, block.number, block.timestamp, msg.sender);
    }

    function setMessage(string newMessage) public{
        message = newMessage;
        emit NewMessage(newMessage, block.number, block.timestamp, msg.sender);
    }
}
