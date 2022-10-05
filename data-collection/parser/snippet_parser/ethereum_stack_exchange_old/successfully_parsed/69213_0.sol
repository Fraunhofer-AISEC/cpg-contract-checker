function publicKeyToAddress (bytes memory publicKey) public pure returns (bytes20) {
    require (publicKey.length == 64);
    return bytes20 (uint160 (uint256 (keccak256 (publicKey))));
}
