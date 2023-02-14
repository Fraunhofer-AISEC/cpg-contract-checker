function requestEthereumPrice(string _currency) public {
    Chainlink.Request memory req = buildChainlinkRequest(specId, this, this.fulfill.selector);
    req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD,EUR,JPY");
    string[] memory path = new string[](1);
    path[0] = _currency;
    req.addStringArray("path", path);
    sendChainlinkRequest(req, ORACLE_PAYMENT);
  }
