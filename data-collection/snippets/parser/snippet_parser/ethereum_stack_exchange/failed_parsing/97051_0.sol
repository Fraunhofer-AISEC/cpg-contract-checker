function fetch() private returns (bytes32 requestId) {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
    request.add("get", ...);
    return sendChainlinkRequestTo(oracle, request, fee);
}

function fulfill(bytes32 _requestId, uint256 _result) public recordChainlinkFulfillment(_requestId) {
    
}
