function getOwnerByIndex(uint256 index) public view returns (address) {
    uint256 tokenId = tokenByIndex(index);
    address owner = ownerOf(tokenId);
    return owner;
}
