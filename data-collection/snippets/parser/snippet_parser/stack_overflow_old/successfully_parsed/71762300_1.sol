function recoverSigner(bytes32 hash, bytes memory signature) public pure returns (address) {
  bytes32 messageDigest = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));

  return ECDSA.recover(messageDigest, signature);
}
