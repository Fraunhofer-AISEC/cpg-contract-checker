function spinWheel() public {
    
    require(bets.length > 0);
    
    require(block.timestamp > nextRoundTimestamp);
    
    nextRoundTimestamp = block.timestamp;
    
    uint diff = block.difficulty;
    bytes32 hash = blockhash(block.number-1);
    Bet memory lb = bets[bets.length-1];
    uint number = uint(keccak256(abi.encodePacked(block.timestamp, diff, hash, lb.betType, lb.player, lb.number))) % 37;
    
    for (uint i = 0; i < bets.length; i++) {
      bool won = false;
      Bet memory b = bets[i];
      if (number == 0) {
        won = (b.betType == 2 && b.number == 0);                   
      } else {
        if (b.betType == 2) { 
          won = (b.number == number);                              
        } 
        else if (b.betType == 1) {
          if (b.number == 0){ 
          won = (number % 2 == 0);
          }              
          else if (b.number == 1){ 
          won = (number % 2 == 1);
          }              
         }
          else if (b.betType == 0) {                   
            if (isBlack(b.number)) {                     
              won = true;
          } else {                                                 
            if (isRed(b.number)) {
              won = true;
          }
        }
      }
    }
  
      
      if (won) 
      {
        address winner = b.player;
       if(!winners[winner]){
        uint index = numberOfWinners++;
        winners[winner] = true;
        lutWinners[index] = winner;
        }
        uint payout = payouts[b.betType] * betAmount;
       winnings[winner] += payout;
       }
    }
    

    
    delete bets;
    
    necessaryBalance = 0;
    
    if (address(this).balance > maxAmountAllowedInTheBank) takeProfits();
    
    emit RandomNumber(number);
    latestWinningNumber = number;
  }
