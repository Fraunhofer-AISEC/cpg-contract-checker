function makeBet(uint _guess, string memory deadline) public payable {
  Game memory newGame = Game(msg.value, _guess, BetStatus(0), msg.sender, address(0), deadline);
  uint current_price = uint(getThePrice());

  if (_guess > current_price) {
    newGame.status = BetStatus.LONG;
  } else if (_guess < current_price) {
    newGame.status = BetStatus.SHORT;
  } else {
    newGame.status = BetStatus.NGMI;
  }

  activeGames.push(newGame);
}
