function getChainId() private view returns (uint256 chainId) {
  assembly {
    chainId := chainid()
  }
}
