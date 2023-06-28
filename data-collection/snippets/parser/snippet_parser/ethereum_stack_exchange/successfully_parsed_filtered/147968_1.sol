function endLottery() private {     
    uint256 winnerTicketId = random() % MAX_ENTRY + 1;
    winner = potentialWinners[winnerTicketId];

    
    uint256 transferAmount = (totalPot*80)/100;
    transferTo(winner,transferAmount);

    emit LotteryWon(winner);
}   
