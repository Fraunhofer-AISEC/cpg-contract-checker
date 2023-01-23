pragma solidity ^0.6.4;

import "contracts/Mortal.sol";

contract Greeter is Mortal {
    string greeting;
   constructor( string memory _greeting) public {
        greeting = _greeting;
    }

    function changeGreeting(  string memory _greeting) public {
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }
}
