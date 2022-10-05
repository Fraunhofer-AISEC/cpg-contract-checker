function pickWinner() public{
    uint index = random() % players.length;
    players[index].transfer(address(this).balance); 
}