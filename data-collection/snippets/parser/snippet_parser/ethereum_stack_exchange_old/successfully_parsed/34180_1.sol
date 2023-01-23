pragma solidity ^0.4.18;

contract Test {
    uint8[] private arr;

    function Test() public {
    }

    function setLength(uint256 length) public {
        arr.length = length;
    }

    function getLength() public constant returns (uint256) {
        return arr.length;
    }
}
