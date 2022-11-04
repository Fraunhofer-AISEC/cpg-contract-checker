function getStableCoinPrice(address pairAddress, address erc20Address) public view returns (uint256) {
    IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
    (uint256 reserve0, uint256 reserve1, ) = pair.getReserves();

    (uint256 reserveA, uint256 reserveB) = erc20Address == pair.token0() ? (reserve0, reserve1) : (reserve1, reserve0);

    ERC20 stableCoin = erc20Address == pair.token0() ? ERC20(pair.token1()) : ERC20(pair.token0());
    
    
    return (reserveA * (10**stableCoin.decimals())) / reserveB;
}
