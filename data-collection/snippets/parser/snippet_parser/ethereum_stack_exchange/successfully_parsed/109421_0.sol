function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
     require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

      string memory newstring = string(abi.encodePacked("{ \"name\" :" , getname(tokenId), "}")); 
    
     return newstring;
 }


