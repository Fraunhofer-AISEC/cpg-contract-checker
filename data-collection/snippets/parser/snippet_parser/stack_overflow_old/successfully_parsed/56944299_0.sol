pragma solidity >=0.4.0 <0.6.0;

contract Inbox{
    string message;

    function set(string memory initialMessage) public {
        message = initialMessage;
    }
    function setMessage(string memory newMessage) public{
        message = newMessage;
    }
}
