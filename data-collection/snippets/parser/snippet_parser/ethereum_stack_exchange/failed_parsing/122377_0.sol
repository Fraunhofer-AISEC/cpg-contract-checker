function tokenURI(uint256 tokenId) public view virtual override returns (string memory){

require(_exists(tokenId),"ERC721Metadata: URI query for nonexistent token");





if (block.timestamp % 2 == 0) {

    return bytes(aUri).length > 0

    ? string(abi.encodePacked(aUri, tokenId.toString(), baseExtension))

    : "";

}
