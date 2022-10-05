function checkConditions(address _oracle, string memory _jobId) external {
    setPublicChainlinkToken();
    Chainlink.Request memory request = buildChainlinkRequest(
        stringToBytes32(_jobId),
        address(this),
        this.fulfill.selector
    );

    request.add("ytChannelId", "UCfpnY5NnBl-8L7SvICuYkYQ");
    sendChainlinkRequestTo(
        _oracle,
        request,
        1 * LINK_DIVISIBILITY
    );
}

event OnFulfill(uint256 _ytViews, uint256 _ytSubs);

function fulfill(
    bytes32 _requestId,
    uint256 _ytViews,
    uint256 _ytSubs
) public recordChainlinkFulfillment(_requestId) {
    emit OnFulfill(_ytViews, _ytSubs);
}
