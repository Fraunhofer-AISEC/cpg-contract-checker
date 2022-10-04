address possibleFactoryAddress;
try IUniswapV2Pair(token).factory() returns (address factory) {
    possibleFactoryAddress = factory;
} catch {}
