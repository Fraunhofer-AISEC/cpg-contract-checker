function startGame(string memory name, uint buyinReq) public payable isNotInGame {     
    require(_initFee == .001 ether, "In order to prevent spam games that never resolve, each game initialization will cost  ether.");
    require(playerInfo[msg.sender].isHost == false, "You are already hosting a game!");
    addFeesPending();
    playerInfo[msg.sender] = Player(name, _gameNumber, 0, 0, false, false, false, false, true);
    address[] memory add;
    idToGame[_gameNumber] = Game(msg.sender, _gameNumber, buyinReq, 0, 0, 0, 0, 0, false, true, add);
    games.push(idToGame[_gameNumber]);
    incGameNumber();
}    
