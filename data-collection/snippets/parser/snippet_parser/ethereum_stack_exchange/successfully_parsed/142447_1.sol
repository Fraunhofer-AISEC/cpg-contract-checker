pragma solidity >=0.4.25 ;

contract inboxx {
    string public message;

    constructor(string memory intialmsg) {
        message = intialmsg;
    }

    function setmessage(string memory newMessage) public {
        message = newMessage;
    }
}
