pragma solidity ^0.4.23;

contract Project {
    bytes32 public value;

    function addValue(bytes32 val) public {
        value = val;
    }
}
