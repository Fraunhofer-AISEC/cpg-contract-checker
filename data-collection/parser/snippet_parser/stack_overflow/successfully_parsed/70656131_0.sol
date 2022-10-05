  function safeMint(address to) public payable {
    require(msg.value >= mintPrice, "Not enough ETH to purchase NFT; check price!"); 
    uint256 tokenId = _tokenIdCounter.current();
    _safeMint(to, tokenId);
    _tokenIdCounter.increment();
}
