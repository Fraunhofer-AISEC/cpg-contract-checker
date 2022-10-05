function distributePrizes(uint16 matchFinished, uint16 teamWinner) public onlyOwner {
  address[1000] memory winners;
  
  uint256 count = 0; 
  uint256 loserBet = 0; 
  uint256 winnerBet = 0; 
  address add;
  uint256 bets;
  address playerAddress;

  
  for(uint256 i = 0; i < players.length; i++){
     playerAddress = players[i];
     
     if(playerInfo[playerAddress].matchSelected == matchFinished &&
        playerInfo[playerAddress].resultSelected == teamWinner){
        winners[count] = playerAddress;
        count++;
     }
   }
   
   if ( teamWinner == 1){
     loserBet = totalBetAway[matchFinished] + totalBetDraw[matchFinished];
     winnerBet = totalBetHome[matchFinished];
   }
   else if ( teamWinner == 2){
     loserBet = totalBetHome[matchFinished] + totalBetDraw[matchFinished];
     winnerBet = totalBetAway[matchFinished];
   }
   else{
      loserBet = totalBetHome[matchFinished] + totalBetAway[matchFinished];
      winnerBet = totalBetDraw[matchFinished];
   }
  
  for(uint256 j = 0; j < count; j++){
      
     if(winners[j] != address(0))
        add = winners[j];
        bets = playerInfo[add].amountBet;
        uint256 amountToPlayer = (bets * (10000+(loserBet*devFee/winnerBet))) / 10000;
        winners[j].transfer(amountToPlayer);
  }
  
  delete playerInfo[playerAddress]; 
  players.length = 0; 
  loserBet = 0; 
  winnerBet = 0;
  
  for(uint256 k = 0; k < 10; k++){
     totalBetHome[k] = 0;
     totalBetAway[k] = 0;
     totalBetDraw[k] = 0;
  }
}
