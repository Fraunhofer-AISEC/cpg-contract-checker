 mapping(uint256 => address) private getMintedAddress;

 function getAllAddresses() public view onlyOwner returns (uint256[] memory) {
    uint256 totalMinted = totalSupply();
    uint256[] memory tokenIds = new uint256[](totalMinted);
    for (uint256 i = 1; i < totalMinted; i++) {
        tokenIds[i] = getMintedAddress[i];
    }
    return tokenIds;
  }
