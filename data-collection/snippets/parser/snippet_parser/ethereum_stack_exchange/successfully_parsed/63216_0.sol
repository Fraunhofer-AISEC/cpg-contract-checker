pragma experimental ABIEncoderV2;
pragma solidity ^0.5.0;

contract ProblemDemo {

    string[] private myStringArray;

    constructor () public {
        myStringArray.push("One");
        myStringArray.push("Two");
        myStringArray.push("Three");
    }

    function addToMyStringArray (string memory newEntry) public {
        myStringArray.push(newEntry);
    }

    function getMyStringArray () public view returns (string[] memory) {
        return myStringArray;
    }
}
