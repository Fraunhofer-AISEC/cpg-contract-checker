contract StorageFactory is SimpleStorage {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _storageIndex, uint256 _storageNumber) public {

        
        
        SimpleStorage(address(simpleStorageArray[_storageIndex])).store(_storageNumber);
    }
}

