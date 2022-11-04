function _mint(address _to, uint256 _tokenId) internal override virtual {
    super._mint(_to, _tokenId);
    tokens.push(_tokenId);
    idToIndex[_tokenId] = tokens.length - 1;
}
