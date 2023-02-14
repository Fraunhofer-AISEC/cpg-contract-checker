pragma solidity ^0.5.1;

contract HelloWorld {
    bytes32 message;
    constructor(bytes32 myMessage) public {
        message = myMessage;
    }

    function getMessage() public view returns(bytes32){
        return message;
    }
}
