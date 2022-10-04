function proofFor(string memory document) public pure returns(bytes32) {
    return sha256(bytes (document));
}
