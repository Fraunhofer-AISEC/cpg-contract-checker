function getPlayerInGame(uint gameNumber, uint playerPos) external returns (address player) {
    return games[gameNumber].playerList[playerPos];
}
