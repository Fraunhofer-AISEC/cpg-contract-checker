  function requestEthereumPrice(address _address) 
    public
    onlyOwner
  {
    
    Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(JOB_ID), address(this), this.fulfill.selector);
    
    req.add("get", "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD");
    
    req.add("path", "USD");
    
    req.addInt("times", 100);
    

    sendChainlinkRequestTo(_address, req, ORACLE_PAYMENT);
  }
