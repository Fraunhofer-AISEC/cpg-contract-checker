function getPlayerCount() external view returns (uint256 count) {
  return playersLength;
}

function deposit() external payable {
  playerLength++;
}
