SimpleStorage[] public simpleStorageArray;

function createSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
}

function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    


simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
}

function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
  
SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
    return simpleStorageArray[_simpleStorageIndex].retrieve();
}
