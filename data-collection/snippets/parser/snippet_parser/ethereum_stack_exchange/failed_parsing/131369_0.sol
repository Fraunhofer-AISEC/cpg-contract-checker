mapping(address => bool) private players;
uint256 public playerCount;
event PlayerRegistered(address player);

function register(address _player) public onlyOwner {
   require(players[_player] != true, "Player already registered");
   players[_player] = true;
   playerCount += 1;
   emit PlayerRegistered(_player);
}
