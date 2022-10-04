function bet(uint _gameId, uint8 _teamSelected) public payable {
  Game storage game = gameInfo[_gameId];
  require(game.state == State.Created,"Game has not been created");
  require(bettingActive);
  
  require(!checkPlayerExists(msg.sender));
  
  
  require(msg.value >= minimumBet);

  
  playerInfo[msg.sender].amountBet = msg.value;
  playerInfo[msg.sender].teamSelected = _teamSelected;

  
  players.push(msg.sender);

  
  if ( _teamSelected == 1){
      totalBetsOne += msg.value;
  }
  else{
      totalBetsTwo += msg.value;
  }
}
