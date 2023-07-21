    function finishRound(address winner) internal {
        emit RoundFinished(winner, raffle[round.current()].prizePool, block.timestamp);
        
        if(!isPaused()){
            resetLottery(); 
        }
    }
