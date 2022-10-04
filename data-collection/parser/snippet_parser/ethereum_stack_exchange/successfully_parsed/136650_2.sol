function hash(ProofData calldata data) internal view returns (bytes32) {
    return
        _hashTypedDataV4(keccak256(abi.encode(TYPE_HASH_EASY, data.user, data.otherUsers)));
}
