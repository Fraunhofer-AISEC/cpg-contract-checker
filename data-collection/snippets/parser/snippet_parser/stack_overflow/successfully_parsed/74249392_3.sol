function getPlayerInfo() public view returns (Player memory) {
    return playerInfo[msg.sender];
}
