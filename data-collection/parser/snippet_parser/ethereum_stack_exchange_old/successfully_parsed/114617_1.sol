function placeBet(uint[][] calldata bets) external returns (uint totalWinnings) {
  uint winningNumber = 12;

  uint totalWinnings;

  for (uint i = 0; i < bets.length; i++) {
    for (uint j = 0; j < bets[i][0].length; j++) {
      if(bets[i][0][j] == winningNumber) {
        uint winnings_toWei = bets[i][0][j];
        totalWinnings += winnings_toWei;
      }
    }
  }

  return totalWinnings;
}
