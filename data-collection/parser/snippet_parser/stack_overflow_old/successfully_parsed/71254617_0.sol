function createCollectible(string memory tokenURI)
    public
    returns (uint256)
{
    uint256 newItemId = tokenId;
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, tokenURI);
    tokenId = tokenId + 1;
    return newItemId;
}
