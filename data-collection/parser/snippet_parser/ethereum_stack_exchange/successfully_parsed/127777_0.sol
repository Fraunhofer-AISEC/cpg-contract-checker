pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";





contract sportContract is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    bytes32 public data;
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() {
        setPublicChainlinkToken();
        
        
        oracle = 0xfF07C97631Ff3bAb5e5e5660Cdf47AdEd8D4d4Fd;
        jobId = "9abb342e5a1d41c6b72941a3064cf55f";
        fee = 0.1 * 10 ** 18; 
    }

    
    function requestData(string memory _date, string memory _team) public returns (bytes32 requestId)  {
        Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
           
        req.add("date", _date);
          req.add("teamName", _team);
        return sendChainlinkRequestTo(oracle, req, fee);
    }

    
    function fulfill(bytes32 _requestId, bytes32 _data) public recordChainlinkFulfillment(_requestId) {
        data = _data;
    }
    
    


}
