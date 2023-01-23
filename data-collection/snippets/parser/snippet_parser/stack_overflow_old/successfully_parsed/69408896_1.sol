function _mint(address to, uint256 tokenId) internal {
    require(to != address(0), "ERC721: mint to the zero address");
    require(!_exists(tokenId), "ERC721: token already minted");

    _tokenOwner[tokenId] = to;
    _ownedTokensCount[to].increment();

    emit Transfer(address(0), to, tokenId);
}
