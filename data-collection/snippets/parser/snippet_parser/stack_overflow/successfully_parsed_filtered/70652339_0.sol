import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";




contract APIPlayerScore is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public playerScore;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    constructor() {
        
        setPublicChainlinkToken();
        oracle = 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8;
        jobId = "d5270d1c311941d0b08bead21fea7747";
        fee = 0.1 * 10 ** 18; 

        
        
        
        
        
    }
    
    
    function requestPlayerScoreData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://****database.app/data.json");
        
        
        
        
        
        
        
        request.add("path", "player.score");
        
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, uint256 _score) public recordChainlinkFulfillment(_requestId)
    {
        playerScore = _score;
    }

    
}
