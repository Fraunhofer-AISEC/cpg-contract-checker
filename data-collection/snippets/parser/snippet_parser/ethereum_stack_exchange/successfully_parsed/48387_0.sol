pragma solidity ^0.4.22;

contract helloWorld {

    string public greeting; 

    string[] public greetings;

    constructor() public {
        greeting = 'hello World';
        greetings.length= greetings.length + 1;
    }

    function setGreeting(string _newGreeting) public {
        greeting = _newGreeting;
        greetings.push(_newGreeting);
    }

    function getGreeting() public view returns (string) {
        return greeting;
    }
}
