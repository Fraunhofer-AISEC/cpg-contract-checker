function allocatePrizes(uint96 _gameId, uint96 teamWinner) public onlyAgent {
        Game storage game = gameInfo[_gameId];
        require(bettingActive == false);
        require(teamWinner == 1 ||teamWinner == 2||teamWinner == 3);
        address[] memory winners = players;
        address[] memory playersAdd = players;
        
        
       
        address add;
        uint96 rewards = 0;
        uint96 count = 0;
        uint96 totalBets = 0;
        uint96 ads = 0;
        uint96 i = 0;
        
        
        for(i = 0; i < playersAdd.length; i++){
            address playerAddress = playersAdd[i];
            
            
            if(playerInfo[playerAddress].teamSelected == teamWinner){
                winners[count] = playerAddress;
                count++;
            }
            playerInfo[playerAddress]._state = PlayerStatus.Not_Joined;
        }


        if ( teamWinner == 1){
           totalBets = totalBetsOne + totalBetsTwo;
           ads =  (totalBets * fee) / totalBetsOne;

        for(i = 0; i < count; i++){

             add = winners[i];
             bets = playerInfo[add].amountBet;


            rewards = (bets * ads) / 10000;
            _pendingBalance[add] += rewards;
        
            }
        }
        else if(teamWinner == 2){
            totalBets = totalBetsOne + totalBetsTwo;
            ads =  (totalBets * fee) / totalBetsTwo;
        
        for( i = 0; i < count; i++){

            
             add = winners[i];
             bets = playerInfo[add].amountBet;

            rewards = (bets * ads) / 10000;
            _pendingBalance[add] += rewards;
        }        
    }
        for(i=0; i < playersAdd.length; i++){
            add = playersAdd[i];
                delete playerInfo[add].amountBet;
                delete playerInfo[add].teamSelected;
                delete playerInfo[add];
        }  
        gameInfo[_gameId] = Game(_gameId, State.Finished);
        game.state == State.Finished;
        players.length = 0; 
        totalBets = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0; 
        bettingActive = true;
    }
