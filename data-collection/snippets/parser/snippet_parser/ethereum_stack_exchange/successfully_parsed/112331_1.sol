function getRandomNumbers(string memory seed) public view returns (uint256[4] memory) {
    (uint a, uint b, uint c, uint d) = (5,5,10,20);
    uint256 randomKeccak = uint256(keccak256(abi.encodePacked(seed, block.difficulty, block.timestamp, block.number)));
    return [
      randomKeccak % a,
      randomKeccak / a % b,
      randomKeccak / a / b % c,
      randomKeccak / a / b / c % d
    ];
}
