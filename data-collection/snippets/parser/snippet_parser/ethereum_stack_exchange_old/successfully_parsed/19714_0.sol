function stringToBytes32(string memory source) returns (bytes32 result) {
    assembly {
    result := mload(add(source, 32))
    }
}
