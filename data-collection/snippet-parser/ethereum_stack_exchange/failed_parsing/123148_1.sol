address[] memory path = new address[](3);
path[0] = address(tokenToSwap);
path[1] = uniswap.WETH();
path[2] = address(tokenOut);
