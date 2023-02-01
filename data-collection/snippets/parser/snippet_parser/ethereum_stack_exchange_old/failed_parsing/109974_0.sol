uint256 balanceBefore = IERC20(token).balanceOf(wallet);

uint256[] memory swappedAmounts = ISwapRouter(SWAP_ROUTER).swapETHForExactTokens{ value: msg.value }(
  price,
  path,
  wallet,
  block.timestamp
);

uint256 balanceAfter = IERC20(token).balanceOf(wallet);

require(balanceAfter > balanceBefore, 'Swap did not succeed');
