function returnClosePrice(string memory _name) public {
    Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.myCallback.selector);
    request.add("name", _name);
    request.add("copyPath", "closePrice");
    receipts[sendChainlinkRequestTo(oracle, request, fee)] = stringToBytes32(_name);
}

function myCallback(bytes32 _requestId, uint256 _price) public recordChainlinkFulfillment(_requestId){
    tokenHash = receipts[_requestId];
    delete receipts[_requestId];
    currentRealEstatePrice[tokenHash] = _price;
    latestRequestId = _requestId;
    price = _price;
}
