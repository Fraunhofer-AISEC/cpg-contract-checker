
    function distributePrizes(uint16 teamWinner) public onlyAgent {
        require(bettingActive == false);
        address[1000] memory winners;
        address[1000] memory draw;
        
        
        uint256 count = 0; 
        uint256 LoserBet = 0; 
        uint256 WinnerBet = 0; 

        
        for(uint256 i = 0; i < players.length; i++){
            address playerAddress = players[i];

            
            
            if(playerInfo[playerAddress].teamSelected == teamWinner){
                winners[count] = playerAddress;
                count++;
            }
        }


        
        if ( teamWinner == 1){
            LoserBet = totalBetsTwo;
            WinnerBet = totalBetsOne;
        
        for(uint256 j = 0; j < count; j++){
            
            if(winners[j] != address(0))
             add = winners[j];
             bets = playerInfo[add].amountBet;

            token.transfer(winners[j],  (bets*(10000+(LoserBet*devFee /WinnerBet)))/10000 );

        }
        delete playerInfo[playerAddress]; 
        players.length = 0; 
        LoserBet = 0; 
        WinnerBet = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0;
        totalBetsDraw = 0;

            
        }
        else if(teamWinner == 2){
            LoserBet = totalBetsOne;
            WinnerBet = totalBetsTwo;
        
        for(uint256 k = 0; k < count; k++){
            
            if(winners[k] != address(0))
             add = winners[k];
             bets = playerInfo[add].amountBet;

            token.transfer(winners[k],  (bets*(10000+(LoserBet*devFee /WinnerBet)))/10000 );

        }
        delete playerInfo[playerAddress]; 
        players.length = 0; 
        LoserBet = 0; 
        WinnerBet = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0;
        totalBetsDraw = 0;
                       
        }
        else if(teamWinner == 3){
            
        uint256 num;
        for(uint256 l = 0; l < players.length; l++){
            address aP = players[l];

            if(playerInfo[aP].teamSelected == 1||playerInfo[aP].teamSelected == 2){
                draw[num] = aP;
                num++;
            }
        }
        
        for(uint256 m = 0; m < num; m++){
            
            if(draw[m] != address(0))
             add = draw[m];
             bets = playerInfo[add].amountBet;

            token.transfer(draw[m],  (bets*(devFee/10000)));

        }
        delete playerInfo[playerAddress]; 
        players.length = 0; 
        LoserBet = 0; 
        WinnerBet = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0;
        totalBetsDraw = 0;

        }
}