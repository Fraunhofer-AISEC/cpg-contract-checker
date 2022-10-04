
pragma solidity ^0.8.0;

contract HelloWorld {
    string public myMessage = "Hello World!";

    event MessageReturned( string message );

    function setMessage( string memory newMessage ) external {
        myMessage = newMessage;
    }

    function getMessage() external view returns( string memory ) {
        return myMessage;
    }

    function sayMessage() external view {
        emit MessageReturned( myMessage );
    }
}
