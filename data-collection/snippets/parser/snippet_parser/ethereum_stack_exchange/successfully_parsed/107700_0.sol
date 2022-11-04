function setBlacklists(address _bots) external onlyOwner {
    require(!bots[_bots]);
    bots[_bots] = true;
}
