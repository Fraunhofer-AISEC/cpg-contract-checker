    function resetLottery() internal {
        
        address lastRoundWinner = raffle[round.current()].lastRoundWinner;
        uint lastRoundPrizePool = raffle[round.current()].lastRoundPrizePool;

        round.increment();
        raffle[round.current()] = RaffleInfo(block.timestamp + nextRoundInfo.interval,nextRoundInfo.interval,round.current(),nextRoundInfo.ticketPrice,address(0),0,GameStatus.IN_PROGRESS,lastRoundWinner,lastRoundPrizePool,0,nextRoundInfo.entryFees);
        awaitingRandomness=false;
        PRIZE_PERCENTAGE = NEXT_ROUND_PRIZE_PERCENTAGE;
        RaffleInfo memory raffleInfo = raffle[round.current()];
        emit RoundStart(raffleInfo.round, block.timestamp, raffleInfo.interval, raffleInfo.endTime);
    }

