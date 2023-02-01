function cancelRequest( bytes32 _requestId) public  onlyOwner {
    cancelChainlinkRequest(_requestId, 0.1e18, this.requested.selector,block.timestamp);
}

function requested(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId) {
    myQuerie = 100;
}
