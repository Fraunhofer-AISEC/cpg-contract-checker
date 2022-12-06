function safeMint(uint256 amount) public payable {
    require(msg.value >= (amount * price()), "Not enough ether sent");
    uint256 tokenId = _tokenIdCounter.current();
    require(tokenId < MAX_SUPPLY, "No more items left.");
    _tokenIdCounter.increment();
    _safeMint(msg.sender, tokenId + 1);
}
