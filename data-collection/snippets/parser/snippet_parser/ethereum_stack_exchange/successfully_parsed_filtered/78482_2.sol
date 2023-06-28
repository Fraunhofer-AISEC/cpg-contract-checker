function toBytes(uint256 a) public pure returns (bytes32) {
    uint i;
    for (i = 0; i < 33; i++) {
        if (a / 256**i == 0) break;
    }
    return bytes32(a) << (32-i)*8;
}
