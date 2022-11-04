function swapTokensForETH(uint amountIn) external {
        
        IERC20(tokenToSwap).transferFrom(msg.sender, address(this), amountIn);
        address[] memory path = new address[](3);
        path[0] = tokenToSwap;
        path[1] = uniswap.WETH(); 
        path[2] = SwaptokenOut;
        IERC20(tokenToSwap).approve(address(uniswap), amountIn);
        uniswap.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amountIn, 
            0, 
            path, 
            address(this), 
            block.timestamp
        );
    }
