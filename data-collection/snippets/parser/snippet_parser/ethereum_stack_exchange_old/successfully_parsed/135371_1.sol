enum TokenType { Type1, Type2 }

mapping (uint256 => TokenType) tokenType;

function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    if (tokenType[tokenId] == TokenType.Type1) {
        return string(abi.encodePacked(tokenURI1, tokenId.toString()));
    } else {
        return string(abi.encodePacked(tokenURI2, tokenId.toString()));
    }
}
