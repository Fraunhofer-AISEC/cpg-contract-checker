function swapTokens(uint256 _tokenAmount, address _tokenIn, address _tokenOut) external payable {
    address[] memory path;
    path = new address[](3);
    path[0] = _tokenIn;
    path[1] = _tokenOut;

    ERC20(_tokenIn).transferFrom(msg.sender, address(this), _tokenAmount);
    ERC20(_tokenIn).approve(uniswapRouter, _tokenAmount);
    
    uint amountOut = IUniswapV2Router(uniswapRouter).getAmountsOut(
        _tokenAmount,
        path
    )[1];
    
    (uint[] memory amounts) = IUniswapV2Router(uniswapRouter).swapTokensForExactTokens(
        _tokenAmount, 
        amountOut,
        path, 
        msg.sender, 
        block.timestamp
        );
    emit TokenSwapEvent(amounts);
}
