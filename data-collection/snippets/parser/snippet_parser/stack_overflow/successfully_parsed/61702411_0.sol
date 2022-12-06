 function requestEthereumPrice(address _address, bytes32 job_id, string url) 
    public
    onlyOwner
  {
    Chainlink.Request memory req = buildChainlinkRequest(stringToBytes32(JOB_ID), address(this), this.fulfill.selector);
    req.add("get", url);
    req.add("path", "USD");
    req.addInt("times", 100);
    sendChainlinkRequestTo(_address, req, ORACLE_PAYMENT);
  }

  function multipleData() public{
      requestEthereumPrice(ORACLE_ADDRESS, JOB_ID);
      requestEthereumPrice(ORACLE2_ADDRESS, JOB2_ID);
      requestEthereumPrice(ORACLE3_ADDRESS, JOB3_ID);
  }

 function fulfill(bytes32 _requestId, uint256 _price)
    public
    
    recordChainlinkFulfillment(_requestId)
  {
    currentPriceList[index] = _price;
    index = (index + 1) & 3
    currentPrice = median();
  }
