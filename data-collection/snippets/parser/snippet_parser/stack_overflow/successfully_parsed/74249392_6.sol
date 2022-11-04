function playerInfo(address addr) public view returns (Player memory) 
    {
        return playerInfo[addr];
    }
