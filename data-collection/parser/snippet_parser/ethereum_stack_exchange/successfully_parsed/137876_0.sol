function searchData(string memory _data) public view returns(uint[] memory) {

    uint counter = 0;

    for (uint i = 0; i < _tokenIdCounter.current(); i++) {
        if (keccak256(abi.encodePacked(_data)) == keccak256(abi.encodePacked(data[i]))) {
            counter++;
        }
    }
    
    uint[] memory arr = new uint[](counter);
    uint count = 0;
    for (uint j = 0; j < _tokenIdCounter.current(); j++) {
        if (keccak256(abi.encodePacked(_data)) == keccak256(abi.encodePacked(data[j]))) {
            arr[count] = j;
            count++;
        }
    }
    return arr; 
}
