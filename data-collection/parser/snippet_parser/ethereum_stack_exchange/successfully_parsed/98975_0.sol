function swapForEth(address tokenAddress, 
    uint amountIn, 
    uint amountOutMin, 
    address to, 
    uint deadline) external onlyOwner payable {

    require(IERC20(tokenAddress).approve(UNISWAP_ROUTER_ADDRESS, uint256(-1)));

    address[] memory path = new address[](2);
    path[0] = tokenAddress;
    path[1] = uniswap.WETH();

    uniswap.swapExactTokensForETH(amountIn, amountOutMin, path, to, deadline);
}
