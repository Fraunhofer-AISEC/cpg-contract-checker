function getTest(uint gameId, uint playerIndex) public view returns (Player memory) {
    return playerInfo[idToGame[gameId].playerList[playerIndex]];
}
