function mint(string calldata _uri,uint value) external onlyOwner {
    token.transfer(receiverAddress,value);
    super._mint(msg.sender, tokenId);
    super._setTokenUri(tokenId, _uri);
    urlOf[tokenId] = _uri;
    tokenId = tokenId + 1;
    emit MintToken(msg.sender, tokenId, _uri,value);
}
