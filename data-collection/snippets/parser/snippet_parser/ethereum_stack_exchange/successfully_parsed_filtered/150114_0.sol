function generateRandomTokenId() internal returns (uint256) {
  uint256 randomNumber = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
  return randomNumber % (10 ** 15); 
}
