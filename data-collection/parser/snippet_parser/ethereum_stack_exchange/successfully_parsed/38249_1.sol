function verify(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) public {
    bytes memory prefix = "\x19Ethereum Signed Message:\n32";
    bytes32 prefixedHash = keccak256(prefix, msgHash);
    a = ecrecover(prefixedHash, v, r, s);
}
