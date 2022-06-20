function notarizeHash(uint256 id, bytes32 documentHash) public onlyOwner noHashExistsYet(id) {
        hashesById[id] = documentHash;

        emit ProofCreated(id, documentHash);
    }
