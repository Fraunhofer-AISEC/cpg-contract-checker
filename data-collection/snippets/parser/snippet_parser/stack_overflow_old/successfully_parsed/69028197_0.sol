pragma solidity 0.7.6;

contract Greeter {

    string public greeting;

    constructor(string memory test) {
        greeting = test;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

}
