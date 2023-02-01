function addBet(uint number) checkCondition(game.winningAddress) returns (bool oerwrittenBet){
      game.winningAddress = address(0);
      game.smallestNumber = 0;
      return game.im_bets.insert(msg.sender,number);
}

modifier checkCondition(winningAddress){
     require(winningAddress == address(0))
     _;
}
