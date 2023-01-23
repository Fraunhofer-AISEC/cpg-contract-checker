 function burn(address to, uint256 tokenId) external {
    require(_exists(tokenId), "Contract: operator query for nonexistent token");
    
    for (uint256 i = 0; i < _tokenIds.length; i ++) {
        if (_tokenIds[i] == tokenId) {
            _tokenIds[i] = _tokenIds[_tokenIds.length - 1];
            _tokenIds.pop();
        }
    }
    
    
    delete _Info[tokenId];
    delete _tokenOwnersMap[tokenId];
    delete _tokenApprovalsMap[tokenId];

    emit Burn(to, tokenId);
}
