function startGame() critical returns (bool) {
    Player player = players[msg.sender];
    if (player.ready) { 
        if (player.balance < minimumwager) { throw; }
            waiting.push(player);
            numWaiting++;
            if (numWaiting > 1) { 
                var thismatchup =  makeMatchup();
                player.playing = true;
                matchupMade(thismatchup); 
                return true; 
            }
            else {
                player.playing = true;
                playerWaiting(player.ethaddress);
                return false; 
            }
        }
    }
}
