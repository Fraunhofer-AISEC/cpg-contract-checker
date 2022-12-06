function _setTokensValues(
  address contractAddress,
  uint256[] memory tokenIds,
  uint256[] memory tokenTraits
) internal {
  require(tokenIds.length == tokenTraits.length, "Wrong arrays provided");
  for (uint256 i; i < tokenIds.length; i++) {
    if (tokenTraits[i] != 0 && tokenTraits[i] <= 3000 ether) {
      _tokensMultiplier[contractAddress][tokenIds[i]] = tokenTraits[i];
    }
  }
}
