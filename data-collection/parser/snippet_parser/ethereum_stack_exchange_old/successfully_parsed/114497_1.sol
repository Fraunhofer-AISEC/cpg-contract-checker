  function setBarn(address _barn) external onlyOwner {
    barn = IBarn(_barn);
  }
