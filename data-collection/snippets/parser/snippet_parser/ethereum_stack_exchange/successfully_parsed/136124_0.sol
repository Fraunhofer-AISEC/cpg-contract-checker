function requestPrivateData() public returns (bytes32 requestId) {
    Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);

    req.add('get', 'https://example.com/api/endpoint');
    req.add('path', 'data');

    return sendChainlinkRequest(req, fee);
}

function fulfill(bytes32 requestId, bytes memory data) public recordChainlinkFulfillment(_requestId) returns (bytes memory) {
    
    return data;
}
