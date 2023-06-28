

pragma solidity 0.8.12;

contract Test {
    address private owner; 

    mapping (address => Record) records;
    enum Animal {Lion, Tiger, Zebra}

    struct Record {
        Animal[] animal; 
    }

    constructor() { 
        owner = msg.sender;
    }

    function addRecord() public {
        Record storage record = records[msg.sender];
        record.animal.push(0);
        
        
    }
}
