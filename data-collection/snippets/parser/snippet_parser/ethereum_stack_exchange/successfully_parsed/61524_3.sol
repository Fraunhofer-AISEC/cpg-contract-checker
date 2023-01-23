function verify(string message, uint8 v, bytes32 r, bytes32 s) public pure returns (address) {
    bytes32 msgHash = keccak256(abi.encodePacked(message));
    address signer = ecrecover(msgHash, v, r, s);
    return signer;
}
