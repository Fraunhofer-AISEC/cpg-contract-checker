function create() public payable returns (bytes32 requestId) {
    require(msg.value >= price, "need to send more eth");
    requestId = requestRandomness(keyHash, fee);
    requestIdToSender[requestId] = msg.sender;
    uint256 tokenId = tokenCounter; 
    requestIdToTokenId[requestId] = tokenId;
    tokenCounter = tokenCounter + 1;
    emit requestedRandomSVG(requestId, tokenId);
}
