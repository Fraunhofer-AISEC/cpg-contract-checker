    function uploadTokenDataToServer(NFT memory nft) public{

     require(LINK.balanceOf(address(this)) >= linkFee, "Not enough LINK - fill contract with faucet");


    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.confirmUpload.selector);
    
    string memory finalURL = append(nft.ID,nft.creator,nft.desc) ;
    
    request.add("get", finalURL);
  
    return sendChainlinkRequestTo(oracle, request, linkFee);
}
