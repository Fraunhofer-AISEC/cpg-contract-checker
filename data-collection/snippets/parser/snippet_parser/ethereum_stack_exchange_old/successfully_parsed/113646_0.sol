
  function mintToken() public payable returns(uint256) {
    require(_deactivated == false, "Token sale is deactivated");
    uint256 price = calculatePrice(msg.sender);
    require(msg.value >= price, "Insufficient ETH sent");

    
    _tokenIds.increment();
    uint256 tokenId = _tokenIds.current();

    
    string memory uri = randomUri();

    
    _safeMint(msg.sender, tokenId);
    _setTokenURI(tokenId, uri);

    return tokenId;
  }

  
  function mintMultipleTokens(uint numberOfTokens) public payable returns(uint256[] memory) {
    require(_deactivated == false, "Token sale is deactivated");
    uint256 price = calculatePrice(msg.sender).mul(numberOfTokens);
    require(msg.value >= price, "Insufficient ETH sent");

    uint256[] memory tokenIds = new uint256[](numberOfTokens);
    for(uint index = 0; index < numberOfTokens; index++) {
      tokenIds[index] = mintToken();
    }
    return tokenIds;
  }
