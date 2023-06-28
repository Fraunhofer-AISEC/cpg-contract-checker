
pragma solidity ^0.7.6;

import "@chainlink/contracts/src/v0.7/ChainlinkClient.sol";


contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public temperature;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    constructor () {
        setPublicChainlinkToken();
        oracle = 0x46cC5EbBe7DA04b45C0e40c061eD2beD20ca7755;
        jobId = "60803b12c6de4443a99a6078aa59ef79";
        fee = 0.1 * 10 ** 18; 
    }
    
    function requestVolumeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);        
        request.add("get", "http://my-api.com");
        request.add("path", "temperature");

        
        
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, uint256 _temperature) public recordChainlinkFulfillment(_requestId) {
        temperature = _temperature;
    }
    
}
