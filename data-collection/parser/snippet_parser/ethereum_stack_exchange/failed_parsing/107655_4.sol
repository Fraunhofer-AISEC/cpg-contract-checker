function bet(uint16 _matchSelected, uint16 _resultSelected) public payable {
  require(matchBettingActive[_matchSelected], "Betting: match voting is disabled");

  


  
  require(msg.value >= minimumBet);
  ...
}
