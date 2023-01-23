function getData(address _storageContract) constant returns(uint256){

    return dataStorage(_storageContract).getUIntValue(sha3("RecordID"));

}
