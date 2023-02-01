    function uniswapErc20ToEth(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn
    ) external {
        callApprove(_tokenIn, UNISWAP_ROUTER, _amountIn);

        uint24 poolFee = 3000;
        
        
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: _tokenIn, 
                tokenOut: _tokenOut, 
                fee: poolFee,
                recipient: address(this),
                deadline: block.timestamp,
                amountIn: _amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        
        UNISWAP_ROUTER_CONTRACT.exactInputSingle{value: 0}(params);
        

        
        
        
    }
