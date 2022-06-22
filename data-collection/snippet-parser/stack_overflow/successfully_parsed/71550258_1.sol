
pragma solidity ^0.6.0;
import "./SimpleStorage.sol"; 

contract StorageFactory is SimpleStorage {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
}

}