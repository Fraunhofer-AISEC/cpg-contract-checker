function bet() public isGame {
        uint dice = diceRoll();      
        
        address winner;
        if (dice == 1) {
            
            balance[players[0]] = some eth;
            balance[players[1]] = less eth;
            winner = players[0];
        }
        else {
            
            balance[players[0]] = less eth;
            balance[players[1]] = some eth;
            winner = players[1];
        }

        if (msg.sender == winner) {
            
        }
