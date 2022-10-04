



contract Labyrinth {

  uint entropy;

  function getRandomNumber() public returns (uint) {
    entropy ^= uint(blockhash(entropy % block.number));
    return entropy;
  }

}
