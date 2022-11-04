function getPlayerInfo(address addr) public view returns (Player memory) {
    addr = msg.sender;
    return playerInfo[addr];
}
