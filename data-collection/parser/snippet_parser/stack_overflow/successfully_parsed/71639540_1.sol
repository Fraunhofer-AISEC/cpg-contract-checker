

pragma solidity  ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory {
SimpleStorage[] public simpleStorageArray;
function createSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
}
function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    
    
    SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
    simpleStorage.store(_simpleStorageNumber);
}
}
function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
    SimpleStorage simpleStorage = SimpleStorage(address(SimpleStorageArray[_simpleStorageIndex]));
    return simpleStorage.retrieve();
}
