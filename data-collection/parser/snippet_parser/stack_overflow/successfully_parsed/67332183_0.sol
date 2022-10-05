pragma solidity ^0.8.4;

contract Project {
    mapping (string => address) addresses;
    
    constructor() {
        addresses['apple'] = address(0x123);
        addresses['orange'] = address(0x456);
    }
    
    function hasAddressOf(string memory _identifier) external view returns (bool) {
        return addresses[_identifier] != address(0);
    }
}
