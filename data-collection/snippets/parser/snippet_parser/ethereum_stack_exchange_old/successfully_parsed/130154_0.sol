    function swapExactInputSingle(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn
    ) private returns (uint256 amountOut) {
        TransferHelper.safeApprove(_tokenIn, address(swapRouter), _amountIn);

        uint32 secondsIn = 10;
        uint256 price = IUniswapV3PriceOracle(uniswapV3PriceOracle).estimateAmountOut(_tokenIn, uint128(_amountIn), secondsIn);

        
        uint256 amountOutMinimum = 1;

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: _tokenIn,
                tokenOut: _tokenOut,
                fee: poolFee,
                recipient: address(this),
                deadline: block.timestamp,
                amountIn: _amountIn,
                amountOutMinimum: amountOutMinimum,
                sqrtPriceLimitX96: 0
            });

        amountOut = swapRouter.exactInputSingle(params);
    }
