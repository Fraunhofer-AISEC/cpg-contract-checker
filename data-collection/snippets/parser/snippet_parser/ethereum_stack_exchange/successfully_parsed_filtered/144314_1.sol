function setLiquidity(uint256 amountA, uint256 amountB) private {
        IERC20(tokenA).transferFrom(msg.sender, address(this), amountA);
        IERC20(tokenB).transferFrom(msg.sender, address(this), amountB);

        IERC20(tokenA).approve(SwapRouter, amountA);
        IERC20(tokenB).approve(SwapRouter, amountB);

        updateReserve(amountA, amountB);
    }
