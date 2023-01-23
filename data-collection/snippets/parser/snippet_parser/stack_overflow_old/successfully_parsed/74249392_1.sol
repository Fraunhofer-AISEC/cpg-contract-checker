function getOtherPlayerInfo(address addr) public view returns (Player memory) {
        return playerInfo[address];
    }
