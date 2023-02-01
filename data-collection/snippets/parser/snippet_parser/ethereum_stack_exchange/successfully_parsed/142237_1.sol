pragma solidity >=0.4.22 <0.9.0;

contract inboxx {
    string public message;

    constructor(string memory intialmsg) {
        message = intialmsg;
    }

    function setmessage(string memory newMessage) public {
        message = newMessage;
    }
}
