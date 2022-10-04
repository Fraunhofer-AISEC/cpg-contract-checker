function convertETHToDAI() external payable {
    require(msg.value > 0, "You must send ETH");
    uint256 deadline = block.timestamp + 15; 
    address tokenIn = WETH9;
    address tokenOut = multiDaiKovan;
    uint24 fee = 3000;
    address recipient = msg.sender;
    uint256 amountIn = msg.value;
    uint256 amountOutMinimum = 1;
    uint160 sqrtPriceLimitX96 = 0;

    ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter.ExactOutputSingleParams(tokenIn,
    tokenOut,
    fee,
    recipient,
    deadline,
    amountIn,
    amountOutMinimum,
    sqrtPriceLimitX96);
    uniswap = IUniSwapRouter(UniswapAddress);

    uniswap.exactOutputSingle{value: msg.value}(params);
    uniswap.refundETH();

    (bool success, ) = msg.sender.call{value: address(this).balance }("");
    require(success, "Refund to caller failed");
}
