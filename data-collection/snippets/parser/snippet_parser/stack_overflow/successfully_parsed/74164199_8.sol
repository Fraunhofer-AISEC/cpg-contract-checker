function initializeGame(string memory name, uint buyinReq) public payable {
    address[] memory add;
    add.push(msg.sender);
    idToGame[gameNumber] = Game(msg.sender, gameNumber, buyinReq, 0, 0, 0, 0, 0, false, add);
    games.push(idToGame[gameNumber]);
}  
