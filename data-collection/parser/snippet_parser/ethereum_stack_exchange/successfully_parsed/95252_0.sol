function getOne(address a, uint8 b) public view returns(bytes32) {
    return map[a][b];
}
