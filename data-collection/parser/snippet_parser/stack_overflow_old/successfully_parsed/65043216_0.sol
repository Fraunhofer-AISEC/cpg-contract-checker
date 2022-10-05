 function requestRIFPriceByCallback(uint256 _payment, address _callback) public {
    Chainlink.Request memory req = buildChainlinkRequest(specId, _callback, this.fulfill.selector);
    req.add("get", "https://api.liquid.com/products/580");
    req.add("path", "last_traded_price");
    req.addInt("times", 100000000);
    sendChainlinkRequest(req, _payment);
  }
