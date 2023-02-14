function storeUserDataHash(uint256 _userId, bytes32 _dataHash) public {
    userDataHashes[_userId] = _dataHash;
}
