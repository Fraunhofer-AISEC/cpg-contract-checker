function getTokenPrice(address pairAddress, uint amount) public view returns(uint)
   {
    IPancakeswapV2Pair pair = IPancakeswapV2Pair(pairAddress);
    IBEP20 token1 = IBEP20(pair.token1);
    (uint Res0, uint Res1,) = pair.getReserves();

    
    uint res0 = Res0*(10**token1.decimals());
    return((amount*res0)/Res1); 
   }
