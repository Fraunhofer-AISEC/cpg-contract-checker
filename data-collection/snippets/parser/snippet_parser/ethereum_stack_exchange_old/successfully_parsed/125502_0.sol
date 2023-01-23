
pragma solidity ^0.8.7;

import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/ChainlinkClient.sol";



contract GenericLargeResponse is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  bytes public data;
  string public image_url;

  constructor() {
    setChainlinkToken(0xa36085F69e2889c224210F603D836748e7dC0088);
    setChainlinkOracle(0x25C7ac1900de67605c0A1812109E960068B1C3d6);
  }

  function requestBytes() public
  {
    bytes32 specId = "b3b68ecd35464833a16613742640ae89";
    uint256 payment = 100000000000000000;
    Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfillBytes.selector);
    req.add("get","https://ipfs.io/ipfs/QmZgsvrA1o1C8BGCrx6mHTqR1Ui1XqbCrtbMVrRLHtuPVD?filename=big-api-response.json");
    req.add("path", "image");
    sendOperatorRequest(req, payment);
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
