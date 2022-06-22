contract TimeServer {

  uint256 FUDGE_FACTOR_IN_BLOCKS = 2;
  uint256 public lastBlockNumber;
  uint256 public lastBlockTime;

  constructor(uint256 firstBlockNumber) {
    require(abs(firstBlockNumber - block.number) < FUDGE_FACTOR_IN_BLOCKS));
    lastBlockNumber = block.number;
    lastBlockTime = now;
  }

  function submitNewTime(uint256 newBlockNumber, uint256 newBlockTime) public {
    uint blockDiff = newBlockNumber - lastBlockNumber;
    require(blockDiff > 0, `New block number must be later than last block')'
    uint timeDiff = newBlockTime - lastBlockTime;
    require(abs(timeDiff / 15) - blockDiff) < FUDGE_FACTOR_IN_BLOCKS,
            'Submitted block time is off by more than +/- fudge factor.') )
    lastBlockNumber = newBlockNumber;
    lastBlockTime = newBlockTime;
  }

}

