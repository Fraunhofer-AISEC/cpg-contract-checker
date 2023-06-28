  function getRandomNumbers(string memory seed) private view returns (uint256[8] memory) {
    return [
      randomise(string(abi.encodePacked("property 1", seed)), property1Arr.length),
      randomise(string(abi.encodePacked("property 2", seed)), property2Arr.length),
      randomise(string(abi.encodePacked("property 3", seed)), property3Arr.length),
      randomise(string(abi.encodePacked("property 4", seed)), property4Arr.length)
    ];
  }

  function randomise(string memory seed, uint256 range) private view returns (uint256) {
    return uint256(keccak256(abi.encodePacked(seed, block.difficulty, block.timestamp, block.number))) % range;
  }
