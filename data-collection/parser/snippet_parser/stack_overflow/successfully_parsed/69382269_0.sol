function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
       require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

       string memory _tokenURI = _tokenURIs[tokenId];
       string memory base = baseURI();
       string memory json = ".json";

       
       if (bytes(base).length == 0) {
           return _tokenURI;
       }
       
       if (bytes(_tokenURI).length > 0) {
           return string( abi.encodePacked(base, _tokenURI, json) );
       }
       
       return string(abi.encodePacked(base, tokenId.toString(), json));
   }
