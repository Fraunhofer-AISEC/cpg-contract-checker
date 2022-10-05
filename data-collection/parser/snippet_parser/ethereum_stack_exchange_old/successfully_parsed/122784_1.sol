    function swapTokensForEth(uint256 tokenAmount) private {
        
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();

        _approve(address(this), address(uniswapV2Router), tokenAmount);

        
        uniswapV2Router.swapExactTokensForETH(
            tokenAmount,
            0, 
            path,
            address(this), 
            block.timestamp
        );
        
        emit SwapTokensForETH(tokenAmount, path);
    }
