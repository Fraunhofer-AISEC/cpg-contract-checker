function swapTokenForEth(address token, uint amountIn) external payable returns (bool) {
    

    address[] memory path = new address[](2);
    uint deadline = block.timestamp + 600;

    path[0] = token;
    path[1] = WETH;

    require(IERC20(token).approve(address(uniswap), (amountIn + 10000)), 'Uniswap approval failed');
    uniswap.swapExactTokensForETH(
        amountIn,
        1, 
        path,
        address(this),
        deadline
    );

    return true;

}

