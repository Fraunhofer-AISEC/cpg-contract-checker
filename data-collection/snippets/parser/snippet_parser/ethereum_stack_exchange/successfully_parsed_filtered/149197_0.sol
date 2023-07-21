        function forceFinalizeRound() external onlyOwner{
            uint randomIndex = randomStatusByRound[round.current()].randomIndex;
            address winner = playersByRoundId[round.current()][randomIndex];

            
            players[winner][round.current()].status = PlayerStatus.WIN;
            players[winner][round.current()].earned = calculatePrize();
            players[winner][round.current()].updatedAt = block.timestamp;
            
            raffle[round.current()].status = GameStatus.FINISHED;
            raffle[round.current()].winner = winner;
            token.transfer(winner, calculatePrize()); 
            token.transfer(address(treasuryAddress), getBalance());
            
            finishRound(winner);
        }

