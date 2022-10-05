function call()
public
onlyOwner returns (bytes32 requestId) {
  Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfillBytes.selector);
  req.add("get", "https://myapi.com/endpoint");
  req.add("path", "url");
  bytes32 reqId = sendChainlinkRequestTo(oracle, req, ORACLE_PAYMENT);
  return reqId;
}
