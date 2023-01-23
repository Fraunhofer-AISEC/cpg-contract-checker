TypeError: Immutable variables cannot be read during contract creation time, which means they cannot be read in the constructor or any function or modifier called from it.
--> TEST.sol:1122:43:
|
1122 | excludeFromMaxTransaction(address(uniswapV2Pair), true);
| ^^^^^^^^^^^^^

TypeError: Immutable variables cannot be read during contract creation time, which means they cannot be read in the constructor or any function or modifier called from it.
--> TEST.sol:1123:46:
|
1123 | _setAutomatedMarketMakerPair(address(uniswapV2Pair), true);
| ^^^^^^^^^^^^^
