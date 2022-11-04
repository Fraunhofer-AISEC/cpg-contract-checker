error Raffle__NotEnoughEthEntered();



function enterRaffle() public payable {
        
        

        
        if (msg.value < i_enteranceFee) {
            revert Raffle__NotEnoughEthEntered();
        }

        if (s_raffleState != RaffleState.OPEN) {
            revert Raffle__NotOpen();
        }
        s_players.push(payable(msg.sender));

        
        
        emit RaffleEnter(msg.sender);
    }
