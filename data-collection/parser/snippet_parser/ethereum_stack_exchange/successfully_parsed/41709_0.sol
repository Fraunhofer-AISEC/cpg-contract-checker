contract MyContract {
  uint lastBlockNumber;

  

  function setLastBlockNumber(uint number) {
    lastBlockNumber = number;
  }

  function claim() public {
    if (block.number >= lastBlockNumber + 10) {
      msg.sender.transfer(this.balance);
    }
  }
}
