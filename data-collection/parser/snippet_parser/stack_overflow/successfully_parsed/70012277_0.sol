
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";




contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    string public volume;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() {
        setPublicChainlinkToken();
        oracle = 0xF405B99ACa8578B9eb989ee2b69D518aaDb90c1F;
        jobId = "c51694e71fa94217b0f4a71b2a6b565a";
        fee = 0.1 * 10 ** 18; 
    }
    
    
    function requestVolumeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");
        
        
        
        
        
        
        
        
        
        
        
        request.add("path", "RAW.ETH.USD.MARKET");
        
        
        
        
        
        
        return sendChainlinkRequestTo(oracle, request, fee);
    }
    
     
    function fulfill(bytes32 _requestId, bytes32 _volume) public recordChainlinkFulfillment(_requestId)
    {
        volume = bytes32ToString(_volume);
        
    }
    
    
    function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
        uint8 i = 0;
        while(i < 32 && _bytes32[i] != 0) {
            i++;
        }
        bytes memory bytesArray = new bytes(i);
        for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }

    
}