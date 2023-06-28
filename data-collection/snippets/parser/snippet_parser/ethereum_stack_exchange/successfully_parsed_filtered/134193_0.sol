function safeMint(uint256 tokenId, string memory uri)
    public
    payable
{
    _safeMint(msg.sender, tokenId);
    _setTokenURI(tokenId, uri);
}
