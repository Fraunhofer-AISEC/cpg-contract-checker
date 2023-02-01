uint256 totalMinted = totalSupply();
address[] memory tokenAddresses = new address[](totalMinted);

for (uint256 i = 0; i < totalMinted; i++) {
    tokenAddresses[i] = getMintedAddress[i];
}
