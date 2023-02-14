        
        
        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: tokenIn, 
                tokenOut: tokenOut, 
                fee: 3000, 
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn, 
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        
        uint256 amountOut = swapRouter.exactInputSingle(params);
