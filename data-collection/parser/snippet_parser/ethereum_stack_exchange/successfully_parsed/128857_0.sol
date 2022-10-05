 function checkUpkeep(
        bytes memory 
    )
        public
        view
        override
        returns (
            bool upkeepNeeded,
            bytes memory 
        )
    {
        bool timePassed = ((block.timestamp - lastTimeStamp) > interval); 
        bool hasPlayers = upBetAddresses.length > 0 ||
            downBetAddresses.length > 0;
        upkeepNeeded = (timePassed && hasPlayers);
        return (upkeepNeeded, "0x0");
    }

    
    function performUpkeep(
        bytes calldata 
    ) external override {
        
        (bool upkeepNeeded, ) = checkUpkeep("");
        if (!upkeepNeeded) {
            revert BET_UPKEEP_NOT_NEEDED();
        }
        
        if ((block.timestamp - lastTimeStamp) > interval) {
            executePlaceBet();
            lastTimeStamp = block.timestamp;
        }
        emit Perform_UpKeep();
    }

    
    function executePlaceBet() private {
     
    }
