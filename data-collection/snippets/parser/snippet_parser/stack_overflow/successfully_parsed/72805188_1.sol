function mintToken(string memory tokenURI,uint price) public payable returns (uint){
    
    require( _usedTokenURIs[tokenURI]==false,"Token URI already exists");
    
    require(msg.value==listingPrice,"Price must be equal to listing fee");
    _tokenIds.increment();
    _listedItems.increment();
    uint newTokenId=_tokenIds.current();
    
    _safeMint(msg.sender,newTokenId);
    _setTokenURI(newTokenId, tokenURI);
    _createNftItem(newTokenId,price);
    
    _usedTokenURIs[tokenURI]=true;
    return newTokenId;
  }
