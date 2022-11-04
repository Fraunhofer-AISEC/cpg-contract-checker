function swap(address _tokenIn, address _tokenOut, uint256 _amountIn, uint256 _amountOutMin, address _to) external {    
    IERC20(_tokenIn).approve(routerPCS, _amountIn);
address[] memory path;
if (_tokenIn == wbnb1 || _tokenOut == wbnb1) {
    path = new address[](2);
    path[0] = _tokenIn;
    path[1] = _tokenOut;
} else {
    path = new address[](3);
    path[0] = _tokenIn;
    path[1] = wbnb1;
    path[2] = _tokenOut;
}
IUniswapV2Router(routerPCS).swapExactTokensForTokens(_amountIn, _amountOutMin, path, _to, block.timestamp);
}
