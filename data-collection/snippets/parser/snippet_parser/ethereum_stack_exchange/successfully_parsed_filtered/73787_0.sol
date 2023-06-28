pragma solidity ^0.4.25;
contract SimpleStorage {

    uint public storedData;

    constructor(uint initVal) public {
        storedData = initVal;
    }

    function set(uint x) public returns (uint retVal) {
        storedData = x;
        return storedData;
    }

    function get() view public returns (uint retVal) {
        return storedData;
    }

}
