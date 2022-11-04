for (uint256 q = 0; q < 4; q++) {
    uint lastHomeDigit = game.score_home_by_period[q] % 10;
    uint lastAwayDigit = game.score_away_by_period[q] % 10;
    uint fRow = downIndexes[lastAwayDigit];
    uint fCell = acrossIndexes[lastHomeDigit];
    uint bRow = downIndexes[lastHomeDigit];
    uint bCell = acrossIndexes[lastAwayDigit];
    BigBoardManagerLib.Winner memory fWinner;
    BigBoardManagerLib.Winner memory bWinner;
    fWinner.winningSquare = squareBuyerz[fRow][fCell];
    fWinner.prize = forwardPrize;
    winners.push(fWinner);
    Winner.winningSquare = squareBuyerz[bRow][bCell];
    bWinner.prize = backwardPrize;
    winners.push(bWinner);               
} 
