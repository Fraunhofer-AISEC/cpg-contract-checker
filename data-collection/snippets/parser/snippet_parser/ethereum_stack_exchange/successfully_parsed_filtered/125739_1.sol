function claimNFT(uint256[] memory tokenIds) external {
    for (uint256 i = 0; i < tokenIds.length; i++) {
        uint256 tokenId = tokenIds[i];
        totalSupply += 1;
        _mint(oldCollection.ownerOf(tokenId), tokenId);
    }
}
