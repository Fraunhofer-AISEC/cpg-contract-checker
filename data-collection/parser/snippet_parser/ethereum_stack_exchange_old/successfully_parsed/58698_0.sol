pragma solidity ^0.4.17;

contract Test {
    string[] public myArray;

    function Test() public {
        myArray.push("hola");
    }

    function getArray() public view returns (string[]) {
        return myArray;
    }
}
