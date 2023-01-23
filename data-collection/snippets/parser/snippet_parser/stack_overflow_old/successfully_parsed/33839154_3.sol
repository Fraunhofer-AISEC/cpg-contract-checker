
pragma solidity ^0.8.9;

contract StorageMemory1{
    uint storageVariable;

    constructor() {
    }

    function assignToValue(uint memoryVariable) public {
        storageVariable = memoryVariable;
    }
}
