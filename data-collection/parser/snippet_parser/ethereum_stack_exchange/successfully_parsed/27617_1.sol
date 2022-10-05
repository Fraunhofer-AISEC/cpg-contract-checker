contract A {
  mapping(address => Game) public games;
  struct Game {
    address player;
    uint8[10] board;
  }
}


function testGetGame() {
  address myAddress;
  var(player, board) = a.games(myAddress);
  
}