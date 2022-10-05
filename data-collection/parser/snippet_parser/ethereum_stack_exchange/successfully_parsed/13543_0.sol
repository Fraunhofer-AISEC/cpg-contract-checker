function testReturnBet(uint index) constant returns (address player, 
                                                     uint tokensPlaced, 
                                                     uint8[4] numbers,
                                                     uint ratioIndex,
                                                     uint timestamp,
                                                     uint rollIndex,
                                                     uint winAmount) {
        bet outBet = bets[index];
        return (outBet.player,
                outBet.tokensPlaced, 
                outBet.numbers, 
                outBet.ratioIndex, 
                outBet.timestamp, 
                outBet.rollIndex, 
                outBet.winAmount);
    }
