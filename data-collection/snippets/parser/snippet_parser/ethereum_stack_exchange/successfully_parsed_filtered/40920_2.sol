function bytes32ToBytes(bytes32 data) internal pure returns (bytes) {
    uint i = 0;
    while (i < 32 && uint(data[i]) != 0) {
        ++i;
    }
    bytes memory result = new bytes(i);
    i = 0;
    while (i < 32 && data[i] != 0) {
        result[i] = data[i];
        ++i;
    }
    return result;
}
