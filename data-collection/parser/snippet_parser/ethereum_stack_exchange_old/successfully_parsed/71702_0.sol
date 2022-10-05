    uint256 lastBlockNumber = block.number - 1;
    bytes32 hashVal = bytes32(block.blockhash(lastBlockNumber));
    bytes5 _byteData = bytes5((hashVal & 0xffffffff) << 216);
