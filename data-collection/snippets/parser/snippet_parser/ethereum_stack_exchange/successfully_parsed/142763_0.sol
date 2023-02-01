 function arbitrage(address routerA, address routerB, address token) external onlyOwner returns(bool){

        address[] memory path2 = new address[](2);
        path2[0] = WETH;
        path2[1] = token;

        address cttAddress = address(this);

        uint amount = IERC20(WETH).balanceOf(cttAddress);
        IERC20(WETH).approve(routerA, amount);

        IUniswapV2Router02(routerA).swapExactTokensForTokensSupportingFeeOnTransferTokens(
            amount, 
            0, 
            path2, 
            cttAddress, 
            block.timestamp + 1200
        );      

        uint tokenBalance = IERC20(token).balanceOf(cttAddress);
        IERC20(token).approve(routerB, tokenBalance);

        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = WETH;

        IUniswapV2Router02(routerB).swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenBalance, 
            0, 
            path, 
            cttAddress, 
            block.timestamp + 1200
        );

        uint finalBalance = IERC20(WETH).balanceOf(cttAddress);
        require(finalBalance >= amount, "No profit");
        return true;
    }
