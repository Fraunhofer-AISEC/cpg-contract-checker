struct Player {
    string name;
    uint gameId;
}

contract Players {
    mapping(address => Player) public playerInfo;

    function setUpPlayerInfo(address addr, Player memory player) public {
        playerInfo[addr] = player;
    }
}
