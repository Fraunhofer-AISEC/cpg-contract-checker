function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchId)
    internal
    whenNotPaused
    override(ERC721, ERC721Enumerable)
{
    super._beforeTokenTransfer(from, to, tokenId, batchId);
}
