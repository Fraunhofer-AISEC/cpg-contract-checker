

pragma solidity ^0.8.0;

contract Post {
    mapping(address => string[]) public messages;
    address[] public users;

    function addMessage(string memory _message) public {
        messages[msg.sender].push(_message);
    }

    function getMessages() public view returns (string[] memory) {
        return messages[msg.sender];
    }
}


