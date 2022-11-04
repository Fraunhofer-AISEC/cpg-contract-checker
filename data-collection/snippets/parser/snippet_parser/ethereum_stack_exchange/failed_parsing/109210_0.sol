    public
  {
    bytes32 specId = "7a97ff8493ec406d90621b2531f9251a";
    uint256 payment = 100000000000000000;
    Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfillBytes.selector);
    string[] memory path = new string[](2);
    path[0] = _summonerid;
    path[1] = "recent";
    req.add("get","https://na1.api.riotgames.com/lol/platform/v4/third-party-code/by-summoner/_summonerid + _apikey"); <- This is my issue... does this work?
    req.add("path", "path");
    requestOracleData(req, payment);
  }```
