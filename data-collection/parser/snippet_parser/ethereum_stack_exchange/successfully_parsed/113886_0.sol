
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";




contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    bytes32 public fire;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() {
        setPublicChainlinkToken();
        oracle = 0x270C24d79A8c334240b3449B8431DaCA1972F438;
        jobId = "c307f6770b6c4ef6b2b168b396f1f9fa";
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function requestFireData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest("c307f6770b6c4ef6b2b168b396f1f9fa", address(this), this.fulfill.selector);
        
        
        request.add("get", "https://ljiigsoedk.execute-api.ca-central-1.amazonaws.com/default/wildfire");
        
        
        
        
        
        
        
        
        
        
        
        request.add("path", "FIRE_NUMBE");
        
        
        
        
        
        
        return sendChainlinkRequestTo(address(0x270C24d79A8c334240b3449B8431DaCA1972F438), request, 1000000000000000000);
    }
    
     
    function fulfill(bytes32 _requestId, bytes32 _fire) public recordChainlinkFulfillment(_requestId)
    {
        fire = _fire;
    }

    
}
