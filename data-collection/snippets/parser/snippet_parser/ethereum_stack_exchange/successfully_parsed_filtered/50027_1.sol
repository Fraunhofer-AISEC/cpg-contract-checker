pragma solidity ^0.4.17;

contract Test {

    function getValue(string something) public view returns (string, uint) {
        return (something, 123);
    }
}
