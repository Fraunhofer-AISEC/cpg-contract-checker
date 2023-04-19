uint256 id;

function requestVolumeData(uint256 _id) public returns (bytes32 requestId) {



    Collab memory collab;

    

    collab.apiUrl = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD";
    
    collab.promoter = msg.sender; 

    collab.client = msg.sender; 

    collab.amount = 0; 

    id = _id;

    collabById[id] = collab;

    Chainlink.Request memory req = buildChainlinkRequest(
        jobId,
        address(this),
        this.fulfill.selector
    );

    
    req.add(
        "get",
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD"
    );
    req.add("path", "RAW,ETH,USD,VOLUME24HOUR"); 
    int256 timesAmount = 10 ** 18;
    req.addInt("times", timesAmount);
    return sendChainlinkRequest(req, fee);
}
