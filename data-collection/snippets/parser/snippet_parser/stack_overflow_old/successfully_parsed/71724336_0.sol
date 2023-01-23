

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage { 

    SimpleStorage[] public simpleStorages;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorages.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        
        
        
        return simpleStorages[_simpleStorageIndex].store(_simpleStorageNumber);
        
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(address(simpleStorages[_simpleStorageIndex])).retrieve();
    }
}
