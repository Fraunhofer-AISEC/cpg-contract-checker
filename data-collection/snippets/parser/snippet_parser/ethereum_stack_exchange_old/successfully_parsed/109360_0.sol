    function swapAndLiquify(uint256 contractTokenBalance) private lockTheSwap {
        
        
        
        uint256 half = contractTokenBalance.div(2);
        uint256 otherHalf = contractTokenBalance.sub(half);

        
        
        
        
        uint256 initialBalance = address(this).balance;

        
        swapTokensForEth(half); 

        
        uint256 newBalance = address(this).balance.sub(initialBalance);

        
        
        
        emit SwapAndLiquify(half, newBalance, otherHalf);
    }

    function getTokenPrice(address pairAddress, uint amount) public view returns(uint)
    {
        IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
        ERC20 token1 = ERC20(pair.token1());
        (uint Res0, uint Res1,) = pair.getReserves();
    
        
        uint res0 = Res0*(10**token1.decimals());
        return((amount*res0)/Res1); 
    }

    function swapTokensForEth(uint256 tokenAmount) public {
        
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = pancakeswap_router.WETH();

        _approve(address(this), address(pancakeswap_router), tokenAmount);

        uint256 minimumAccepted = getTokenPrice(uniswapV2Pair, tokenAmount).mul(90).div(100); 
        
        pancakeswap_router.swapExactTokensForETH(
            tokenAmount,
            minimumAccepted,
            path,
            address(this),
            block.timestamp
        );
    }
