
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";




contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public games;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() {
        setPublicChainlinkToken();
        oracle = 0x75095239a719cE30A91c1bc77713420F7950BF70;
        jobId = "c41b2ccd05e841e28c2026bb5e2e6e05";
        fee = 0.1 * 10**18;
    }
    
    
    function requestGamesData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        
        
        
        
        
        
        
        
        
        
        
        request.add("playerId", "90026231");
        
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, uint256 _games) public recordChainlinkFulfillment(_requestId)
    {
        games = _games;
    }

    
}


