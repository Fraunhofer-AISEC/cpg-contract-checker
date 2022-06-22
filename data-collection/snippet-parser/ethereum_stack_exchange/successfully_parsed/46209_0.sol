function addPlayer(address player) constant returns (address[]) {
   paidPlayers.push(player);
   return paidPlayers;
}
