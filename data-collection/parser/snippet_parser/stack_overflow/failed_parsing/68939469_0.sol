  using Chainlink for Chainlink.Request;

  
  bytes public data;
  string public image_url;

  constructor() {
    setChainlinkToken(0xa36085F69e2889c224210F603D836748e7dC0088);
    setChainlinkOracle(0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8);
  }

  function requestBytes(
  )
    public
  {
    bytes32 specId = "7a97ff8493ec406d90621b2531f9251a";
    uint256 payment = 100000000000000000;
    Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfillBytes.selector);
    req.add("get","--- ExampleApi---");
    req.add("path", "---ExamplePath---");
    requestOracleData(req, payment);
  }

  event RequestFulfilled(
    bytes32 indexed requestId,
    bytes indexed data
  );

  
  function fulfillBytes(
    bytes32 requestId,
    bytes memory bytesData
  )
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, bytesData);
    data = bytesData;
    image_url = string(data);
  }

}
