

pragma solidity ^0.8.0;

import "./SimpleStorage.sol"; 

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContact() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
}
