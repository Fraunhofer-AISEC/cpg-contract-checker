contract MyNFT is
    Context,
    AccessControlEnumerable,
    Ownable,
    ERC721Enumerable,
    ERC721Pausable
{
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {
        require(_exists(tokenId), "DramaLlamas: ownership query for nonexistent token");

        address owner = _owners[tokenId];
        if (owner == address(0)) {
            return _creatorAddress;
        } else {
            return owner;
        }
    }
}
