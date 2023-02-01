function initializeGame(string memory name, uint buyinReq) public payable {
    address[] memory add;
    idToGame[gameNumber] = Game(msg.sender, gameNumber, buyinReq, 0, 0, 0, 0, 0, false, add);
    idToGame[gameNumber].playerList.push(msg.sender);
    games.push(idToGame[gameNumber]);
}  
