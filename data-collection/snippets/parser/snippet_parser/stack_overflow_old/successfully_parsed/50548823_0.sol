pragma solidity ^0.4.18;


contract Greetings{

    string public message;

    constructor() public {
        message = "Hello";
    }

    function getGreeting() public view returns (string){
        return message;
    }

}
