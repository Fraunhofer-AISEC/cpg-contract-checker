function getLength() public view returns (uint) {
    return publicData.length;
}

function getDataLength(uint index) public view returns (uint) {
    return publicData[index].length;
}
