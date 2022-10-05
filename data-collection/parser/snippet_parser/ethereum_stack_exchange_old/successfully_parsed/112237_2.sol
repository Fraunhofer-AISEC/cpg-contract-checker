function updateEntityArray(uint _data) public {
    uint addressEntityIndex = addressesEntityIndex[msg.sender];
    entityArray[addressEntityIndex].data = _data
}
