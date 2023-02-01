function mint(address to, uint256 tokenId) external {
    
    ownedTokensCount[to] += 1;
    tokenOwner[tokenId] = to;
    ownedTokens[to] = tokenId;
}
