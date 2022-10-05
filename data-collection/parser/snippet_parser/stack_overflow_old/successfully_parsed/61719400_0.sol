  function requestLINKPrice() 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(JOB, address(this), this.fulfill.selector);
    req.add("get", "https://api.coingecko.com/api/v3/simple/price?ids=chainlink&vs_currencies=usd");
    req.add("path", "chainlinkUSD");
    req.addInt("times", 100);
    sendChainlinkRequestTo(ORACLE, req, ORACLE_PAYMENT);
  }

