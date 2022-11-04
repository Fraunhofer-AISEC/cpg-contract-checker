import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol';
    function pairFor(address factory, address tokenA, address tokenB) internal view returns (address pair) {
        pair = IUniswapV2Factory(factory).getPair(tokenA,tokenB);
    }
