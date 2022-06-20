function _spawnPlayer(uint256 id) external {
    require(playerIndexToOwner[id] == address(0));
    players.push(Player(id));
    playerIndexToOwner[id] = address(this);
}
