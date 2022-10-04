function allocatePrizes(uint _gameId, uint16 teamWinner) public onlyAgent {
        Game storage game = gameInfo[_gameId];
        require(bettingActive == false);
        address[1000] memory winners;
        address[1000] memory draw;
        
        
       
        totalBets = 0;
        count = 0;
        
        
        for( i = 0; i < players.length; i++){
            address playerAddress = players[i];
            
            
            if(playerInfo[playerAddress].teamSelected == teamWinner){
                winners[count] = playerAddress;
                count++;
            }
            playerInfo[playerAddress]._state = PlayerStatus.Not_Joined;
        }


        
        if ( teamWinner == 1){
            totalBets = totalBetsOne + totalBetsTwo;
        
        for(i = 0; i < count; i++){
            
            if(winners[i] != address(0)){
             add = winners[i];
             bets = playerInfo[add].amountBet;

            
             rewards = (bets*(10000-550 *(totalBets / totalBetsOne))) / 10000;
            _pendingBalance[add] += rewards;
            }
           
        }
        for(i=0; i < players.length; i++){
            add = players[i];
            if(players[i] != address(0)){
                delete playerInfo[add].amountBet;
                delete playerInfo[add].teamSelected;
                delete playerInfo[add];
            }
        }  
        bettingActive = true;
        gameInfo[_gameId] = Game(_gameId, State.Finished);
        game.state == State.Finished;
        players.length = 0; 
        totalBets = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0;  
        }
        else if(teamWinner == 2){
            totalBets = totalBetsOne + totalBetsTwo;  
        
        for( i = 0; i < count; i++){

            
            if(winners[i] != address(0)){
             add = winners[i];
             bets = playerInfo[add].amountBet;

            
            rewards = (bets*(10000-550 *(totalBets / totalBetsTwo))) / 10000; 
            _pendingBalance[add] += rewards;
            }
        }
    
        for(i=0; i < players.length; i++){
            add = players[i];
            if(players[i] != address(0)){
                delete playerInfo[add].amountBet;
                delete playerInfo[add].teamSelected;
                delete playerInfo[add];
            }
        }
        bettingActive = true;
        gameInfo[_gameId] = Game(_gameId, State.Finished);
        game.state == State.Finished;
        players.length = 0; 
        totalBets = 0;
        totalBetsOne = 0;
        totalBetsTwo = 0;                
        }
        else if(teamWinner == 3){
            totalBets = totalBetsOne + totalBetsTwo;
            
        num = 0;
        for( i = 0; i < players.length; i++){
            add = players[i];

            if(playerInfo[add].teamSelected == 1||playerInfo[add].teamSelected == 2){
                draw[num] = add;
                num++;
            }
        }
        
        for( i = 0; i < num; i++){
            
            if(draw[i] != address(0)){
             add = draw[i];
             bets = playerInfo[add].amountBet;

            
            
            rewards = (bets*(10000-fee))/10000;
            _pendingBalance[add] += rewards;
        }
        bettingActive = true;
        gameInfo[_gameId] = Game(_gameId, State.Finished);
        game.state == State.Finished;
        delete playerInfo[add];
        delete playerInfo[add].amountBet;
        delete playerInfo[add].teamSelected;
        playerInfo[add]._state = PlayerStatus.Not_Joined;
        players.length = 0; 
        totalBetsOne = 0;
        totalBetsTwo = 0;
        totalBets = 0;
        }
       
    }
       
    }
