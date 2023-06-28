function requestPrice()
  public
{
  Chainlink.Request memory req = buildChainlinkRequest(jobId, this, this.fulfill.selector);

  req.addInt("times", 100);

  sendChainlinkRequest(req, LINK * 1);
}
