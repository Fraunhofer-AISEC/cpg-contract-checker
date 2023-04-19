IUniswapV2Pair(pairA).swap( amount0Out2, amount1Out2, pairB, new bytes(0));
IUniswapV2Pair(pairB).swap( amount0Out2, amount1Out2, pairC, new bytes(0));
IUniswapV2Pair(pairC).swap( amount0Out2, amount1Out2, address(this), new bytes(0));
uint b = IERC20(base).balanceOf(address(this));
