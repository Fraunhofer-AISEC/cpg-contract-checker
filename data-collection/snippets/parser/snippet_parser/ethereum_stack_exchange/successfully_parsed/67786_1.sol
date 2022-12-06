contract Labyrinth {

  
  

  uint entropy;

  function getRandomishNumber() public returns (uint) {
    uint offset = entropy % 255 + 1; 
    uint blockNumber = block.number - offset;
    entropy ^= uint(blockhash(blockNumber));
    return entropy;
  }

}
