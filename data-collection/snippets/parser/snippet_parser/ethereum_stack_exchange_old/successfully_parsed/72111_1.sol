pragma solidity >=0.4.0 <0.6.0;

contract Stratus {

    string public greeting;
    address public owner;

    event GreetingChanged (string oldGreeting, string newGreeting);

    constructor(string memory _greeting) public {
        greeting = _greeting;
        owner = msg.sender;
    }

    function setGreeting (string memory _greeting) public {
        require(owner == msg.sender);
        emit GreetingChanged(greeting,_greeting);
        greeting = _greeting;
        }
    }
