
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;
  
    uint256 public volume;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    constructor() {
        setPublicChainlinkToken();
        oracle = 0xD8269ebfE7fCdfCF6FaB16Bb4A782dC8Ab59b53C;
        jobId = "2e0441fe857e45bca8f0d349bb680afd";
        fee = 0.1 * 10 ** 18; 
    }
    
    function requestVolumeData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        request.add("get", "https://testnets-api.opensea.io/api/v1/assets?owner=0x16ea840cfA174FdAC738905C4E5dB59Fd86912a1&order_direction=desc&offset=0&limit=1");

        request.add("path", "assets");
        
        int timesAmount = 10**18;
        request.addInt("times", timesAmount);

        return sendChainlinkRequestTo(oracle, request, fee);
    }

    function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId)
    {
        volume = _volume;
    }
}
