

pragma solidity ^0.8.16;

library MappingDataTypes {
    struct UintMappingValue {
        uint256 value;
        bool isSet;
    }
}

contract Storage {
    mapping(address => MappingDataTypes.UintMappingValue) uintStorage;

    
    function getUnitStorage(address ownerAddr) public returns (MappingDataTypes.UintMappingValue storage) {
        return uintStorage[ownerAddr];
    }


    function storeValue(uint256 value) public {
        
        
        MappingDataTypes.UintMappingValue storage storedValue = getUnitStorage(msg.sender);
        storedValue.isSet = true;
        storedValue.value = value;
    }


}

