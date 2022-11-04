function checkUpkeep(bytes calldata ) public override returns (bool upkeepNeeded, bytes memory ) {
        bool isOpen = (RaffleState.OPEN == s_raffleState);
        bool timePassed = ((block.timestamp - s_lastTimeStamp) > i_interval);
        bool hasPlayers = (s_players.length > 0);
        bool hasBalance = address(this).balance > 0;
        upkeepNeeded = (isOpen && timePassed && hasPlayers && hasBalance);
    }

    function performUpkeep(bytes calldata ) external override{
        (bool upkeepNeeded, ) = checkUpkeep(""); 
        ...
    }
