function bytesOf(bytes32 source, uint start, uint count) private pure returns(bytes32) {
    bytes32 result;
    uint end = start + count;
    for (uint i = start; i < end; i++) {
        result[i - start] = source[i];
    }
    return result;
}
