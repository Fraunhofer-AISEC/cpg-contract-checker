

pragma solidity ^0.8.0;

contract GreetingsContract {
    
    string message;


    function Greetings() public {
        message =  "I'm ready!";
    }


    function setGreetings(string calldata _message) public {
        message = _message;
    }


    **function getGreetings() public view returns (string calldata) {
        return message;
    }**
}
