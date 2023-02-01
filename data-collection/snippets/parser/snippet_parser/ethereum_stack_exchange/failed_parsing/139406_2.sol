function officialWinner(uint8 winningNumber) private returns ( uint256 ) {
               uint winnerCount = playersByNumber[winningNumber].length;
               
         

         if (winnerCount < 0){
           ab;
         }


         if (winnerCount > 0) {

             uint256 balanceToDistribute = address(this).balance/(2*winnerCount);

                 for (uint i = 0; i<winnerCount; i++) {
                     require(i==0);
            playersByNumber[winningNumber][i].transfer(balanceToDistribute);
           lotteryHistory[lotteryId] =  playersByNumber[winningNumber][i];
         
           address winner =  playersByNumber[winningNumber][i]; 
             lastWinner = winner;
             lastWinningAmount[winner] = balanceToDistribute;
              lastWinnerAmount=  lastWinningAmount[winner];  
       
           } 
