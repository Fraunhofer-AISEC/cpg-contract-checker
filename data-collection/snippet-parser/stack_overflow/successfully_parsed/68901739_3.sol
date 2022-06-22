
mapping (uint256 => bool) isMatchEnabled;

function enableBetting(uint256 _matchId) external onlyOwner {
    isBettingEnabled[_matchId] = true;
}

function disableBetting(uint256 _matchId) external onlyOwner {
    isBettingEnabled[_matchId] = false;
}
