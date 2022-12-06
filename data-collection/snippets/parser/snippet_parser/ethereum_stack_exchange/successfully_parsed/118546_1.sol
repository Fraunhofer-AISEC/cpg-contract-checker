function getTotalSupply(address token) view returns (uint256) {
   return IERC20(token).totalSupply()
}
