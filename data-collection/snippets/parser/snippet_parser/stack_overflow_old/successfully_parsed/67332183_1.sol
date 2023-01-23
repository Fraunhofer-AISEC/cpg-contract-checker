pragma solidity ^0.8.4;

contract Project {
    mapping (string => address) public addresses;
    
    constructor() {
        addresses['apple'] = address(0x123);
        addresses['orange'] = address(0x456);
    }
}
