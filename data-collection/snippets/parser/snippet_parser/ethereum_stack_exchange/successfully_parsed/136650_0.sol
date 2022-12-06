struct ProofData {
    address user;
}

bytes32 constant TYPE_HASH_EASY = keccak256("ProofData(address user)");    

function hash(ProofData calldata data) internal view returns (bytes32) {
    return
        _hashTypedDataV4(keccak256(abi.encode(TYPE_HASH_EASY, data.user)));
}

function verify(
    address signer,
    ProofData calldata data,
    bytes memory _signature
) public view returns (bool) {
     return
         SignatureChecker.isValidSignatureNow(
             signer,
             hash(data),
             _signature
         );

}
