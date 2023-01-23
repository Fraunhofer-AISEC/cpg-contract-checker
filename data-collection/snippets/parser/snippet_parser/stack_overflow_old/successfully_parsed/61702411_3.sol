function requestEthereumPrice(address precoordinator_address, bytes32 service_agreement, string url) 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(service_agreement, address(this), this.fulfill.selector);
    req.add("get", url);
    req.add("path", "USD");
    req.addInt("times", 100);
    sendChainlinkRequestTo(precoordinator_address, req, ORACLE_PAYMENT);
  }
