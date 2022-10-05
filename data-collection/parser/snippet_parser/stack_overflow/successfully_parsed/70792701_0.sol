pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public price;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    

    constructor() {
        setChainlinkToken(0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06);
        oracle = 0x19f7f3bF88CB208B0C422CC2b8E2bd23ee461DD1;
        jobId = "9b32442f55d74362b26c608c6e9bb80c";
        fee = 0.0001 * 10 ** 18; 
    }
    
    function requestPriceData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        request.add("get", "https://api.pancakeswap.info/api/v2/tokens/0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82");
        request.add("path", "price");
        
        
        int timesAmount = 10**18;
        request.addInt("times", timesAmount);
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
    function fulfill(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId)
    {
        price = _price;
    }


}
