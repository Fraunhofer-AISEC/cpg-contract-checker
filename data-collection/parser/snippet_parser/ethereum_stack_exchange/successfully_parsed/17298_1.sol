function addBet(uint number) returns (bool overwrittenBet) {
    if (game.winningAddress != address(0)) {
        
        game.winningAddress = address(0);
        game.smallestNumber = 0;
    }
    return game.im_bets.insert(msg.sender,number); 
}
