function CreateGame(uint amountRequired, string memory timeoption) public restricted{
        setGameDuration(timeoption);
        gameid++;

        Game memory newGame = Game({
            participants: address[] participants,
            amountRequired: amountRequired,
            Duration: gametime,
            id: gameid,
            ended: false,
            createdTime: block.timestamp

        });
        
    }
