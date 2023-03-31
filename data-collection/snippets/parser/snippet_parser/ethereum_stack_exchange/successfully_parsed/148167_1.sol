function verifyLastBlockHash(bytes32 hashToCheck) public { 
            bytes32 lastBlockHash = blockhash(block.number - 1);
            bool result = lastBlockHash == hashToCheck;
            counter++;
            emit ReturnValue(lastBlockHash, hashToCheck, result);
        }
