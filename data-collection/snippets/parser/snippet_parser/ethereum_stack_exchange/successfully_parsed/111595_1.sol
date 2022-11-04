
  function createRequestTo(
    address _oracle,
    bytes32 _jobId,
    uint256 _payment
  )
    public
    onlyOwner
    returns (bytes32 requestId)
  {
    Chainlink.Request memory req = buildChainlinkRequest(_jobId, address(this), this.fulfill_random.selector);
    requestId = sendChainlinkRequestTo(_oracle, req, _payment);
  }
