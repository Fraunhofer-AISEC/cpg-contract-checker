function swapExactETHforTokens(
    address tokenOut,
    uint256 amountOut,
    uint256 deadline
) external payable {
    address[] memory path = new address[](2);
    path[0] = uniswap.WETH();
    path[1] = tokenOut;

    uniswap.swapExactETHForTokens{value: msg.value}(
        amountOut,
        path,
        msg.sender,
        deadline
    );
}
