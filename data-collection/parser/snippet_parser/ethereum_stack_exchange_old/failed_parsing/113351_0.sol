function buyTokenParts(uint256 _tokenId, uint256 _tokenParts) public payable {
    Token memory token = tokens[_tokenId];
    uint256 pricePerPart = token.value/token.parts;
    require(msg.value >= _tokenParts*pricePerPart);
    ...
}
