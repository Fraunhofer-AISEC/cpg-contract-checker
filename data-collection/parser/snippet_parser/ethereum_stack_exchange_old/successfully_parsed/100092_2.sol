function makeBet(uint _guess, string memory deadline) public payable {  
  BetStatus newStatus;
  uint current_price = uint(getThePrice());

  if (_guess > current_price) {
    newStatus = BetStatus.LONG;
  } else if (_guess < current_price) {
    newStatus = BetStatus.SHORT;
  } else {
    newStatus = BetStatus.NGMI;
  }

  activeGames.push(Game({
    betPrice: msg.value, 
    betAmount: _guess, 
    status: newStatus, 
    maker: msg.sender, 
    taker: address(0), 
    deadline: deadline}));
}
