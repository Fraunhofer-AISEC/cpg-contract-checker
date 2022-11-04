uint[2] storage responses;   

function requestVolumeData(bytes32 _jobId, address _oracle) public returns (bytes32 requestId) {
Chainlink.Request memory request =
        buildChainlinkRequest(_jobId, address(this), this.fulfill.selector);

    
    request.add(
        "get",
        "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD"
    );

    
    request.add("path", "RAW.ETH.USD.VOLUME24HOUR");

    
    int256 timesAmount = 10**18;
    request.addInt("times", timesAmount);

    
    return sendChainlinkRequestTo(_oracle, request, fee);
}
