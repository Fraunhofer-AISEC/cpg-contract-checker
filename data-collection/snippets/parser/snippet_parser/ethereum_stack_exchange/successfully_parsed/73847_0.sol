pragma solidity ^0.4.25;
contract SimpleStorage {

    uint public storedData;
    event numberSaved(uint number);

    constructor(uint initVal) public {
        storedData = initVal;
    }

    function set(uint x) public{
        storedData = x;
        emit numberSaved(storedData);
    }

    function get() view public returns (uint retVal) {
        return storedData;
    }

}
