function getTokenPrice(uint256 tokenID) returns (uint 256) {
    if(tokenID >= 0 && tokenID <= 49) {
     tokenIdAndItsPriceDictionary[tokenID] = 1000000000000000000 wei; 
  }
  else if(tokenID >= 50 && tokenID <= 99) {
     tokenIdAndItsPriceDictionary[tokenID] = 2000000000000000000 wei; 
  }
  else if(tokenID >= 100 && tokenID <= 149) {
     tokenIdAndItsPriceDictionary[tokenID] = 3000000000000000000 wei; 
  }  
  

  return tokenIdAndItsPriceDictionary[tokenID]
}
