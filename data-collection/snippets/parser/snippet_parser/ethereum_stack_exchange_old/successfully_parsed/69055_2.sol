function proofFor(bytes memory document) public pure returns(bytes32) {
    return sha256(document);
}
