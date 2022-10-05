  uint weiDue = calculateTotalWei(winningBets[i].tokensDeposited, winningBets[i].amounts, multipliers) / totalWeiBetWinningTeam * totalWeiBetLosingTeam;

  
  weiDueEv(calculateTotalWei(winningBets[i].tokensDeposited, winningBets[i].amounts, multipliers), totalWeiBetWinningTeam, totalWeiBetLosingTeam, weiDue);
