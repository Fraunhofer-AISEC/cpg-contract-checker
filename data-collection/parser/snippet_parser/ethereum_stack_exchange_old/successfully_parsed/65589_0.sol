pragma solidity ^0.4.24;

contract User {
    mapping(uint=>address) addresses;
    uint addressRegistryCount;   

    function set(address userAddress) public {
        addresses[addressRegistryCount] = userAddress;
        addressRegistryCount++;
    }

    function get(address userAddress) public view returns (uint) {
        for (uint i = 0; i <= addressRegistryCount; i++) {
            if(addresses[i] == userAddress)
                return i;
        }
    }

    
}
