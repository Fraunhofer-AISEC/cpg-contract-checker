function uri(uint256 tokenId) public view override(ERC1155, ERC1155URIStorage) returns (string memory) {
    return ERC1155URIStorage.uri(tokenId);
}
