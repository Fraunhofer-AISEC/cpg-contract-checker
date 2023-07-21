function swapToWeth(
        address[] calldata tokens,
        uint256[] calldata amounts
    ) public  {
        require(tokens.length == amounts.length, "TokenSwapper: Invalid inputs");
        
        
        for (uint256 i = 0; i < tokens.length; i++) {
            
            if(tokens[i]==address(weth)){
                wethAmount+=amounts[i];
                continue;
            }
            address[] memory path = new address[](2);
            path[0] = tokens[i];
            path[1] = address(weth);

            uint256[] memory amountsOut = uniswapRouter.getAmountsOut(amounts[i], path);
            require(amountsOut[1] > 0, "TokenSwapper: Invalid swap");
            
            IERC20(tokens[i]).approve(address(uniswapRouter), amounts[i]);
            uniswapRouter.swapExactTokensForTokens(
                amounts[i],
                amountsOut[1],
                path,
                address(this),
                block.timestamp
            );
            wethAmount+=amountsOut[0];
            emit make_weth(path[0],path[1],amountsOut);
        }
        emit WethValue(wethAmount);

    }
