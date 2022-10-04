 mapping(uint256 => address) private getMintedAddress;

 function getAllAddresses() public view returns (address[] memory) {
    uint256 totalMinted = totalSupply();
    address[] memory tokenAddresses = new address[](totalMinted);

    for (uint256 i = 1; i < totalMinted; i++) {
        tokenAddresses[i] = getMintedAddress[i];
    }
     return tokenAddresses;
  }

