function verify(bytes32 message, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
    bytes memory prefix = "\x19Ethereum Signed Message:\n32";
    bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, message));
    address signer = ecrecover(prefixedHash, v, r, s);
    return signer;
}
