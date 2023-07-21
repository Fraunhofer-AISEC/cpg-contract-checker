uint256 amountOut = 70 ether;  
(uint256 reserveIn, uint256 reserveOut) = UniswapV2Library.getReserves(FACTORY_ADDRESS, USDC_ADDRESS, WMATIC_ADDRESS);
uint256 amountIn = UniswapV2Library.getAmountIn(amountOut, reserveIn, reserveOut);
