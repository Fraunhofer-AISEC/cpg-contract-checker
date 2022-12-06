function swapEth(address router, address _tokenIn, address _tokenOut, uint _amount) public {
    IERC20(router).approve(router, _amount);
    address[] memory path;
    path = new address[](2);
    path[0] = _tokenIn;
    path[1] = _tokenOut;
    uint deadline = block.timestamp + 300;
    IUniswapV2Router(router). swapExactETHForTokens(... parameters);  
}
