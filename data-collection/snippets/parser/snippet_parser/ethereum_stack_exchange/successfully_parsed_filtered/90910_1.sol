function Buy(uint amountIn, uint amountOutMin, uint deadline, address tokenAddress) external payable restricted {
    uniswapRouter.swapExactTokensForTokens(amountIn, amountOutMin, getPathForETHtoToken(tokenAddress), address(this), deadline);
}


