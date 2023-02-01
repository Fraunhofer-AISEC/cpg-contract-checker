
function ownerOf(uint256 tokenId) public view returns (address) {
    require(expiries[tokenId] > now);
    return super.ownerOf(tokenId);
}
