
pragma solidity ^0.8.17;

contract Greeter {
    string greeting;

    constructor(string memory _greeting) {
        greeting = _greeting;
    }

    function greet() external view returns(string memory){
        return greeting;
    }
}
