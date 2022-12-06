
      function DataMine(ChainlinkRequestETHPrice _callee1, uint256 tokenId) public {
    uint2str(tokenId);
    setId(_callee1, tokenId);
    getETHPrice(_callee1, RarityId);
}

  function setId(ChainlinkRequestETHPrice _callee, uint256 tokenId) internal{
     _callee.setId(tokenId);
 }

   function getRarity(uint256 tokenId, uint256 _price) external {
    rarity = _price;
    setResources(tokenId, rarity);
}



which will be used to determine the resources
   function setResources(uint256 tokenId, uint256 _rarity) internal {
tokenIdToPlanetInstance[tokenId].level = 1;
tokenIdToPlanetInstance[tokenId].maxLevel = 3;

    if (_rarity < 500) {
tokenIdToPlanetInstance[tokenId].science = 1;
    } else if (_rarity < 1000) {
tokenIdToPlanetInstance[tokenId].science = 2;
    } else if (_rarity < 1500){
tokenIdToPlanetInstance[tokenId].science = 3;
tokenIdToPlanetInstance[tokenId].wealth = 5;
tokenIdToPlanetInstance[tokenId].food = 4;
    }
    else if (_rarity < 1800){
tokenIdToPlanetInstance[tokenId].science = 6;
} else {
tokenIdToPlanetInstance[tokenId].science = 7;
}

}
