function tokenURIExists(string memory tokenURI) public view returns(bool){
    return _usedTokenURIs[tokenURI]==true;
  }
