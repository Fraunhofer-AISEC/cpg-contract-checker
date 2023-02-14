 function pickAWinner() public restricted {
    require(this.balance >= 10 ether);
    uint index = random() % players.length;
    players[index].transfer(this.balance);
    players = new address[](0);
  }
