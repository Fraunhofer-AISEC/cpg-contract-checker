function getBatchCount() public view returns(uint) {
    return batchIds.count();
}

function getBatchIdAtIndex(uint index) public view returns(bytes32) {
    return batchIds.keyAtIndex(index); 
}
