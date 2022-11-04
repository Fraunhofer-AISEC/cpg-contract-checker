import "https://github.com/smartcontractkit/chainlink/contracts/src/v0.6/ChainlinkClient.sol";
contract MyClient is ChainlinkClient {
    function doRequest(uint256 _payment) public {
        Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfill.selector);
        req.add("fetchURL", "https://datafeed.xyz/eth");
        req.add("jsonPath", "data,result");
        sendChainlinkRequest(req, _payment);
    }

    function fulfill(bytes32 requestID, uint256 answer) public {
        
    }
}
