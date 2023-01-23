    function safeMint(address to, string memory uri) public onlyOwner {
    uint256 tokenId = _tokenIdCounter.current();
    _tokenIdCounter.increment();
    _safeMint(address(this), tokenId);
    _setTokenURI(tokenId, uri);
}
