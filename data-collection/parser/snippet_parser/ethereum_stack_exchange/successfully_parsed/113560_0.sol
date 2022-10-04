pragma solidity ^0.8.9;

contract Message {
    address myMessage;

    function setMessage() public {
        myMessage = msg.sender;
    }
}
