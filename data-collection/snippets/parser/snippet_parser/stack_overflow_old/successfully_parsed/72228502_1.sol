  function mint() public returns (uint256) {
    uint256 tokenId = _tokenIds.current();
    require(tokenId <= MAX_TOKEN_ID);

    token.approve(address(this), NFT_PRICE);
    token.transfer(address(this), NFT_PRICE);

    _mint(msg.sender, tokenId);
    _setTokenURI(tokenId, TOKEN_URI);

    _tokenIds.increment();
    return tokenId;
  }
