
function _addLiquidity(
    address tokenA,
    address tokenB,
    uint amountADesired,
    uint amountBDesired,
    uint amountAMin,
    uint amountBMin
) internal virtual returns (uint amountA, uint amountB) {
    
    if (IPancakeFactory(factory).getPair(tokenA, tokenB) == address(0)) {
        IPancakeFactory(factory).createPair(tokenA, tokenB);
    }
    (uint reserveA, uint reserveB) = PancakeLibrary.getReserves(factory, tokenA, tokenB);
    if (reserveA == 0 && reserveB == 0) {
        (amountA, amountB) = (amountADesired, amountBDesired);
    } else {
        uint amountBOptimal = PancakeLibrary.quote(amountADesired, reserveA, reserveB); 
        if (amountBOptimal <= amountBDesired) {
            require(amountBOptimal >= amountBMin, 'PancakeRouter: INSUFFICIENT_B_AMOUNT');
            (amountA, amountB) = (amountADesired, amountBOptimal);
        } else {
            uint amountAOptimal = PancakeLibrary.quote(amountBDesired, reserveB, reserveA); 
            assert(amountAOptimal <= amountADesired);
            require(amountAOptimal >= amountAMin, 'PancakeRouter: INSUFFICIENT_A_AMOUNT');
            (amountA, amountB) = (amountAOptimal, amountBDesired);
        }
    }
}
