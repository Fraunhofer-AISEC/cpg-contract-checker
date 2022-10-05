pragma solidity ^0.4.19;

contract Stratus {

    string public greeting;
    address public owner;

    event GreetingChanged (string oldGreeting, string newGreeting)

    function Stratus(string _greeting) {
        greeting = _greeting;
        owner = msg.sender;
    }

    function setGreeting (string _greeting){
        require(owner == msg.sender)
        GreetingChanged(greeting,_greeting)
        greeting = _greeting
        }
    }
