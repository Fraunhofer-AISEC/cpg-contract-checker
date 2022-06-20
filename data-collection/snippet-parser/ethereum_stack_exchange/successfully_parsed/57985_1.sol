  function recoverAddr(bytes32 msgHash, uint8 v, bytes32 r, bytes32 s) public returns (address) {
    address signer = ecrecover(msgHash, v, r, s);
    emit LogMyHash(msgHash);
    emit LogMyAddress(signer);
    return signer;
}
