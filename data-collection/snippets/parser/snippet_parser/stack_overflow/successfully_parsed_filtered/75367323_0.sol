function _baseURI() internal pure override returns (string memory) {
    return "https://ipfs.io/ipfs/QmXZKcU9WDZxvXvxoAL4YdZVR5Ssj97ayEYRPqYBHrRSb2";
}

function safeMint(address to, uint256 tokenId) public onlyOwner {
    _safeMint(to, tokenId);
}
