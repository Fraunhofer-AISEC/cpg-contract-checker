function transferApprove(uint _amountIn, address _routerAddress) internal
    {
        TransferHelper.safeTransferFrom(
            ETH,
            msg.sender,
            address(this),
            _amountIn
        );

        TransferHelper.safeApprove(WETH9, _routerAddress, _amountIn);
    }

    function swapExactInputSingle(uint _amountIn)  external returns (uint amountOut)
    {
      require(_amountIn > 0, "cannot swap 0 ETH");
      emit value(_amountIn);
        transferApprove(_amountIn, UNISWAP_V3_ROUTER);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
                tokenIn: ETH,
                tokenOut: WETH9,
                fee: 3000,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: _amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        amountOut = uniswapRouter.exactInputSingle(params);
    }
