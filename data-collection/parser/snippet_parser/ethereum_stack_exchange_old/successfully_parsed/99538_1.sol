function uploadMetaDataToServer(uint256 tokenID, address creator) external returns (bytes32 requestId) 
{
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
  

        string memory finalURL = strConcat('https://baseURL.com/dev/nft/metadata/',addressToString(creator),'/',uint2str(12345)); 
        
    request.add("get", finalURL );
    request.add("path", "CREATED");
    
 
     sendChainlinkRequestTo(oracle, request, fee);
}
