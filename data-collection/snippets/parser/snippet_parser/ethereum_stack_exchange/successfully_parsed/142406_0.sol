    function resolveImplementation(uint256 amountIn, SwapResolverOptions memory swapResolverOptions) public returns (uint256 amountOut) {
        
        TransferHelper.safeTransferFrom(swapResolverOptions.inputTokenAddress, _msgSender(), address(this), amountIn);
        TransferHelper.safeApprove(swapResolverOptions.inputTokenAddress, address(router), amountIn);
       
        ISwapRouter.ExactInputParams memory params =
            ISwapRouter.ExactInputParams({
                path: swapResolverOptions.path,
                recipient: swapResolverOptions.destinationAddress,
                
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0
            });

        amountOut = router.exactInput(params);
    }
