function initializeGame(string memory name, uint buyinReq) public payable {
    idToGame[gameNumber] = Game(msg.sender, gameNumber, buyinReq, 0, 0, 0, 0, 0, false, playerList.push(msg.sender));
    games.push(idToGame[gameNumber]);
}  
