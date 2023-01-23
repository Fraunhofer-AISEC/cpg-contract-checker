function getGameInfo(uint id) public view returns (Game memory) {
    return idToGame[id];
}
