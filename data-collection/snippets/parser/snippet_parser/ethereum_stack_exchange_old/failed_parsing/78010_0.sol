function getPlayers(address players, bool enabled) external {
    require(
        msg.sender == _admin,
    );
    emit setPlayers(players, enabled);
    arr[players] = enabled;
}
