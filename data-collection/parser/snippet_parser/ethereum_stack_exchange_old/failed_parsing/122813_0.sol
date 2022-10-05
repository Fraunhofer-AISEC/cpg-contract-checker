            uint256 lusdBalance = UNI_ROUTER.exactInput(
            ISwapRouter.ExactInputParams({
            path: abi.encodePacked(WETH, uint24(500), USDC, uint24(500), LUSD),
            recipient: address(this),
            deadline: block.timestamp,
            amountIn: wethBalance,
            amountOutMinimum: 0
            })
