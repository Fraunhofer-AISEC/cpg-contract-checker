   function getTokenPriceAB(address pairAddress) public override view returns(uint) {

        IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);

        IERC20 token1 = IERC20(pair.token1());
        (uint Res0, uint Res1,) = pair.getReserves();

        require(Res1 != 0, "Division by zero");

        
        uint res0 = Res0.mul(10**token1.decimals());

        
        
        return((1000000000000000000*res0)/Res1); 
    }
