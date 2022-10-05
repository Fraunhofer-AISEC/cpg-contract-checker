function encode256(uint128 a, uint128 b) pure public returns (uint256) {
    return uint256(bytes32(abi.encodePacked(a, b)));
}
