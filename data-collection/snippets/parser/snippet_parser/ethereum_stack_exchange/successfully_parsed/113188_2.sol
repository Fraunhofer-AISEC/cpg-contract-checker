function collision() public pure {
    bytes32 hash1 = keccak256(abi.encode(32, 1, 0x6100000000000000000000000000000000000000000000000000000000000000));
    bytes32 hash2 = keccak256(abi.encode("a"));
    require(hash1 == hash2);
}
