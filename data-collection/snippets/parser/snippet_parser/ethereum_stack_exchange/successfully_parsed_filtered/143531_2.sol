function kyberswapEthToErc20(
        address _tokenIn,
        address _tokenOut,
        uint256 amountIn,
        address routerr
    ) public {
        uint16 poolFee = 3000;

        IKyberswapRouter.ExactInputSingleParams memory params = IKyberswapRouter
            .ExactInputSingleParams({
                tokenIn: _tokenIn,
                tokenOut: _tokenOut,
                fee: poolFee,
                recipient: address(this),
                deadline: block.timestamp + 300,
                amountIn: amountIn,
                minAmountOut: 0,
                limitSqrtP: 0
            });
        IKyberswapRouter(routerr).swapExactInputSingle{value: amountIn}(params);
    }
