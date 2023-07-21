function verify(address signer, uint256 timestamp, bytes memory signature, bytes32 sigR, bytes32 sigS, uint8 sigV) public view returns (bool) {
    require(block.timestamp < (timestamp + 3600))
    return signer == ecrecover(signature, sigV, sigR, sigS);
}
