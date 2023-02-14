function _swap(address fromToken, address toToken, uint256 amountIn, address to) internal returns (uint256 amountOut) {

    if(amountIn == 0) {
        return 0;
    }
    
    
    IUniswapV2Pair pair = IUniswapV2Pair(factory.getPair(fromToken, toToken));
    require(address(pair) != address(0), "TreasureFinder: Cannot convert");

    
    
    (uint256 reserve0, uint256 reserve1,) = pair.getReserves();
    uint256 amountInWithFee = amountIn.mul(uint(1000).sub(pair.totalFee()));
    if (fromToken == pair.token0()) {
        amountOut = amountInWithFee.mul(reserve1) / reserve0.mul(1000).add(amountInWithFee);
        IERC20Uniswap(fromToken).safeTransfer(address(pair), amountIn);
        pair.swap(0, amountOut, to, new bytes(0));
        
    } else {
        amountOut = amountInWithFee.mul(reserve0) / reserve1.mul(1000).add(amountInWithFee);
        IERC20Uniswap(fromToken).safeTransfer(address(pair), amountIn);
        pair.swap(amountOut, 0, to, new bytes(0));
        
    }
}
