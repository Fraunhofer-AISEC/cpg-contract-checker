 function swap(
        address _router,
        address _tokenIn,
        address _tokenOut,
        uint amountIn,
        uint amountOutMin
    ) 
        private 
        onlyOwner
    {
        IERC20(_tokenIn).approve(_router,amountIn);
        address[] memory path;
        path = new address[](2);
        path[0]=_tokenIn;
        path[1]=_tokenOut;
        uint deadline=block.timestamp+300;
        IUniswapV2Router(_router).swapExactTokensForTokens(amountIn, amountOutMin, path, address(this), deadline);    
    }
