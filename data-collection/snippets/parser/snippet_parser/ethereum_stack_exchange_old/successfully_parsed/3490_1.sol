contract MyGame {
  int currentGame = 1;
  struct Register {
    int gameNumber;
  }
  mapping (address => Register) players;  

  function Play() {
    players[msg.sender].gameNumber = currentGame;
  }

  function HasPlayed() {
    return players[msg.sender].gameNumber == currentGame;
  }

  function NextGame() {
    currentGame++;
  }
}
