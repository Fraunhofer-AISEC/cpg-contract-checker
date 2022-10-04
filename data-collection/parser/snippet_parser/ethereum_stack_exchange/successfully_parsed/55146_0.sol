function joinGame(bytes32 _commitment) public payable {
  uint256 gameId = notReallyRandomButBetterThanNothing(games.length);

  Game storage game = games[gameId];

  game.player2 = msg.sender;
}

function notReallyRandomButBetterThanNothing(uint256 _max) internal 
  pure returns(uint256) {

  return uint256(keccak256(block.timestamp)) % _max + 1;
}
