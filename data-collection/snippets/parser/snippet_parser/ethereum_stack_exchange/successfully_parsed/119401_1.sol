function getWhitelistState(address user) public view returns(bool) {
    return whitelistes[user];
  }
  function setWhitelistAddresses(address[] calldata addresses) external onlyOwner {
    for (uint8 i = 0; i < addresses.length; i++) 
      whitelisted[addresses[i]] = true;
    whitelistAccessCount += addresses.length;
  }
