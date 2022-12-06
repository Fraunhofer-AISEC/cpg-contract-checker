function createTrade(bytes32 tradeId, uint256 amount) public onlyOwner {
    

    uint256 newTokenId = _tokenIds.current();
    _tokenIds.increment();
    _safeMint(address(this), newTokenId);

    require(createInternalTrade(tradeId, newTokenId, amount));
}

function buyTrade(bytes32 tradeId) public payable {
    
    

    transferFrom(address(this), msg.sender, trade.tokenId);

    
}
