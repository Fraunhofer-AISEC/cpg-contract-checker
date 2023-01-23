import "./simpleStorage.sol";


pragma solidity ^0.8.0;



contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
       SimpleStorage simpleStorage = new SimpleStorage(); 
       simpleStorageArray.push(simpleStorage);
    }
}
