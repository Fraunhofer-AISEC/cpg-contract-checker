function hashVal(string val) public pure returns (bytes32) {
    return keccak256(val);
}
