function bet(uint16 _gameId, uint8 _teamSelected) public payable {
  Game storage game = gameInfo[_gameId];

  require(game.state == State.Created,"Game has not been created");
  require(matchBettingActive[_gameId] == true);
  
  
  
  require(!checkPlayerExists(msg.sender));
  
  
  require(msg.value >= minimumBet);

  
  Player storage playerS = playerInfo[msg.sender];
  playerS.push(Player(msg.sender, _gameId, msg.value, _teamSelected,)-1; 
  
  
  bytes32[] storage userBets = userToBets[msg.sender]; 
  userBets.push(_gameId);




  
  players.push(msg.sender);

  
  if ( _teamSelected == 1){
      totalBetsOne += msg.value;
  }
  else{
      totalBetsTwo += msg.value;
  }
}
