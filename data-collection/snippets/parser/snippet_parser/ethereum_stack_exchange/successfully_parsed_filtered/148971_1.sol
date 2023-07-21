function pickWinner() internal {
  
        if(raffle[round.current()].playerCount == 0){
            finishRound(address(0));
        } else if(raffle[round.current()].playerCount == 1){
            token.transfer(address(raffle[round.current()].players[0]), calculatePrize()); 
            token.transfer(address(treasuryAddress), getBalance());
            finishRound(address(raffle[round.current()].players[0]));
        } else{
               awaitingRandomness=true;
               uint256 requestId = requestRandomness(callbackGasLimit,requestConfirmations,numWords);

               randomnessIds[round.current()] = requestId;
               raffle[round.current()].status = GameStatus.PICKING_WINNER;
        }
        
    }
