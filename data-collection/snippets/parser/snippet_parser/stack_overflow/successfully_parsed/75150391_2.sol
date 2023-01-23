contract Target {
  uint256 public lastCalledAtBlockNumber;

  
  
  function foo() external {
    lastCalledAtBlockNumber = block.number;
  }
}
