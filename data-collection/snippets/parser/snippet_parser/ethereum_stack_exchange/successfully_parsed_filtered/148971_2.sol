function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {

        uint256 randomIndex = randomWords[0] % raffle[round.current()].players.length;
        address winner = raffle[round.current()].players[randomIndex];

        Game storage currentGameOfPlayer = players[winner][round.current()];
        currentGameOfPlayer.status = PlayerStatus.WIN;
        currentGameOfPlayer.earned = calculatePrize();
        currentGameOfPlayer.updatedAt = block.timestamp;
         
        raffle[round.current()].status = GameStatus.FINISHED;
        raffle[round.current()].winner = winner;
        token.transfer(winner, calculatePrize()); 
        token.transfer(address(treasuryAddress), getBalance());
        
        finishRound(winner);
    }
