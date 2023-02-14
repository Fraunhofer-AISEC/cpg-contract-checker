function changeAttributes(uint256 newStat, uint256 tokenId, string memory newTokenURI) public {
    require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: caller is not owner nor approved"
        );
    tokenIdToStat[tokenId] = newStats;
    _setTokenURI(tokenId, newTokenURI);
}
