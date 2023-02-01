function bet(uint16 _matchSelected, uint16 _resultSelected) public payable {
   require(matchBettingActive[_matchSelected], "Betting: match voting is disabled");
  
  

  
  require(msg.value >= minimumBet);
  
   
  
  playerInfo[msg.sender].amountBet = msg.value;
  playerInfo[msg.sender].matchSelected = _matchSelected;
  playerInfo[msg.sender].resultSelected = _resultSelected;
  
  
  players.push(msg.sender);
  
  MatchID[] storage bets = matchDetails[_matchSelected];
  bets.push(MatchID(msg.sender, _matchSelected, msg.value, _resultSelected))-1;
  
  uint16[] storage userBets = userToBets[msg.sender];
  userBets.push[_matchSelected];

  
  if ( _resultSelected == 1){
      totalBetHome[_matchSelected] += msg.value;
  }
  else if( _resultSelected == 2){
      totalBetAway[_matchSelected] += msg.value;
  }
  else{
      totalBetDraw[_matchSelected] += msg.value;
  }
