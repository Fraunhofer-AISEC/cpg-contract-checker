Oracle = 
JOB = 
function requestJoke() public
  {
    Chainlink.Request memory req = buildChainlinkRequest(JOB, address(this), this.fulfill.selector);
    req.add("get", "https://sv443.net/jokeapi/v2/joke/Any");
    req.add("path", "joke");
    sendChainlinkRequestTo(ORACLE, req, ORACLE_PAYMENT);
  }
