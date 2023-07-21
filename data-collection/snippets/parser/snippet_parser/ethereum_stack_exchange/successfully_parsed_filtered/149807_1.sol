function getmap(bytes memory key) public view returns (string memory) {
    return map[convert(key)];
}
