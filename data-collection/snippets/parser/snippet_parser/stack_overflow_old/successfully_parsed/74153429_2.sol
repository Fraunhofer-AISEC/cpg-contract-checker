function getSaltedHash(uint answer, bytes32 salt) pure returns (bytes32) {
    return keccak256(abi.encodePacked(answer, salt));
}
