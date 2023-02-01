function determineWinner() public {
        require(msg.sender == owner);
        require(state == LotteryState.SecondRound, "Admin please set to second round");
        state = LotteryState.Finished;

     uint8[5] memory winningNumbers = setWinNum(numsFixed); -- says undeclared identifier
    
   
   


         officialWinner(winningNumbers[]);

     selfdestruct(owner);
    }
