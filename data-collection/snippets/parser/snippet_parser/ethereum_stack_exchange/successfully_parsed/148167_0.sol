function verifyLastBlockHashPure(bytes32 hashToCheck) public view returns(uint, bytes32, bytes32, bool) {
        uint blockNumber = block.number - 1;
        bytes32 lastBlockHash = blockhash(blockNumber);
        return (blockNumber, lastBlockHash, hashToCheck, lastBlockHash == hashToCheck);
    }
