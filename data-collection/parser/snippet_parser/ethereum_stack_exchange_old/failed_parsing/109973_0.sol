function test(uint a, uint b) pure public returns (bytes32) {
    bytes32 hash = keccak256(abi.encodePacked(uint40(a), b);
    return hash;
}
