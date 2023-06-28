function _swapOnUniswap(
   address[] memory _path,
   uint256 _amountIn,
   uint256 _amountOut
) internal {
   require(
      IERC20(_path[0]).approve(address(uRouter), _amountIn),
      "Uniswap approval failed."
   );

   uRouter.swapExactTokensForTokens(
      _amountIn,
      _amountOut,
      _path,
      address(this),
      (block.timestamp + 1200)
   );
}
