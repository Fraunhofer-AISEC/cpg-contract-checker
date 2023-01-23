function () public payable {
        require(currentStage == Stages.icoStart);
        require(msg.value > 0);
        require(remainingTokens > 0);
