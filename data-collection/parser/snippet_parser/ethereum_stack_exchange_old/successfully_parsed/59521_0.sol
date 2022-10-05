function pickWinner() public {
  require(msg.sender == manager);
  uint index = random() % players.length;
  players[index].transfer(this.balance);
  players = new address[](0);
}
