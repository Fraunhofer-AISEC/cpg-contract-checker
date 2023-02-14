
pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol";


contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public temperature;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    constructor () public {
        setPublicChainlinkToken(); 
        
        
        
        
        
        
        oracle = <oracle id>; 
        jobId = <job id>;
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function requestVolumeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        
        
        request.add("get", "http://api.weatherstack.com/current?access_key=7940b0c1136901badcb304724132b234&query=Mumbai");
        
        
        
        
        
        
        
        
        
        
        
        request.add("path", "current.temperature");
        
        
        
        
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, uint256 _temperature) public recordChainlinkFulfillment(_requestId)
    {
        temperature = _temperature;
    }

    
}
