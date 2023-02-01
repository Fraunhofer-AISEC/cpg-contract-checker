function submitHash(bytes32[] calldata docHash,string[] calldata doc4DHash) external onlyOwner() {
       emit onSubmissionBoth(docHash,doc4DHash);
    }
