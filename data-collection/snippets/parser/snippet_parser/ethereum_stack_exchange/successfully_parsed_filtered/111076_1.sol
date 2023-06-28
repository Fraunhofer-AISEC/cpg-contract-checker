
    function distributePrizes(uint16 teamWinner) public onlyOwner {
        require(bettingActive == false);
        address[1000] memory winners;
        
        
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
        }
        else{
            LoserBet = totalBetsOne;
            WinnerBet = totalBetsTwo;
        }


        
        for(uint256 j = 0; j < count; j++){
            
            if(winners[j] != address(0))
             address add = winners[j];
             uint256 bet = playerInfo[add].amountBet;
            


            token.transferFrom(address(this), winners[j],  (bet*(10000+(LoserBet*devFee /WinnerBet)))/10000 );

        }
        delete playerInfo[playerAddress]; 
        players.length = 0; 
        LoserBet = 0; 
        WinnerBet = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0;
    }
