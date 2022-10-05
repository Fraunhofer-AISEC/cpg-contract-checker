function grossDoNotUse() public view returns(address[] memory) {
    address[] memory playerList;
    for(uint i=0; i<getPlayerCount(); i++) {
        playerList[i] = players[i];
    }
    return playerList;
}
