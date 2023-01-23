function verify(bytes32 message, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
    address signer = ecrecover(message, v, r, s);
    return signer;
}
