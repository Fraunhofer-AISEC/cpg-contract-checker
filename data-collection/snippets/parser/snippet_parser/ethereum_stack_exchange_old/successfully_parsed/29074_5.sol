pragma solidity ^0.4.18;

contract Echo {
    bytes32 public message;

    function sendMessage(bytes32 _message) public {
        message = _message;
    }

    function getMessage() view public returns (bytes32) {
        return message;
    }
}
