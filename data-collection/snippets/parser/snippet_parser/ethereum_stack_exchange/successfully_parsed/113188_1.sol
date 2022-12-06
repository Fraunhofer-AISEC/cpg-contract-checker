function collision() public pure {
    require(keccak256(abi.encode([1, 2], 3)) == keccak256(abi.encode(1, 2, 3)));
}
