  function getWinner() 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(JOB, address(this), this.fulfill.selector);
    req.add("get", "example-winner.com/winner");
    req.add("path", "winner");
    sendChainlinkRequestTo(ORACLE, req, ORACLE_PAYMENT);
  }
