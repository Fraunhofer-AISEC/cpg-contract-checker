     function getETHPrice(string memory RarityId) external returns (bytes32 requestId){
     Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
     request.add("get", "https://www.myWebsite.com/json/rarities.json");
     request.add("path", RarityId);
     request.addInt("times", 1);
     return sendChainlinkRequestTo(oracle, request, fee);
 }



function setId(uint256 _Id) external {
    Id = _Id;
}


the 1 contract to set the value internally.
    function fulfill( bytes32 _requestId, uint256 _price) public{
    price = _price;
    Exoplanets_TestContract caller = Exoplanets_TestContract(0xeF49A76fF6962bfa01D1e35887f0831AcA271984);
    caller.getRarity(Id, price);
} 

}
