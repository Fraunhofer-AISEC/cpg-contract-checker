function getPlayers(uint inputId) external returns (address[] memory playerList) {
    playerList = games[inputId].playerList;
}
