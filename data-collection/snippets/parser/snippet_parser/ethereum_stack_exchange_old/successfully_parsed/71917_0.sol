pragma solidity ^0.5.8;

contract Names {

    uint lastId;
    mapping(uint => string) public numberedNames;

    constructor() public {
        lastId = 0;
    }

    function setName(string memory name) public {
        numberedNames[lastId] = name;
        lastId++;
    }
}
