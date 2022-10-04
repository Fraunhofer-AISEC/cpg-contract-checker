bytes32 myHash = block.blockhash(block.number - 1);
uint256 hashNum = uint256(myHash);



uint256 last = (hashNum * 2 ** 252) / (2 ** 252);



uint256 secondLast = (hashNum * 2 ** 248) / (2 ** 252);
