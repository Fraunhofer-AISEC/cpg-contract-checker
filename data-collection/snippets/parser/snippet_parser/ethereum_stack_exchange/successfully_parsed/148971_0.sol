    function checkUpkeep(
        bytes calldata 
    )
        external
        view
        override
        returns (bool upkeepNeeded, bytes memory)
    {
        upkeepNeeded = (!isPaused() && !awaitingRandomness && block.timestamp>=raffle[round.current()].endTime);
    }

    function performUpkeep(bytes calldata) external override {
       
        if (!isPaused() && !awaitingRandomness && block.timestamp>=raffle[round.current()].endTime) {
            pickWinner();
        }
    }
