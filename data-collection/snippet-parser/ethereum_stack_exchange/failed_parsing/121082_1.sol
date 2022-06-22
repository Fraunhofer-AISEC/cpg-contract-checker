uint256 totalMinted = totalSupply();
uint256[] memory tokenIds = new uint256[](totalMinted);

for (uint256 i = 0; i < totalMinted; i++) {
    tokenIds[i] = getMintedAddress[i];
}
