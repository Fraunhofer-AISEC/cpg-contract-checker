contract ShittySwap {
    Pool[] public pools;

    function addPool(address tokenA, address tokenB) public {
        lpToken newLp = new lpToken("ShittyLP", "SLP");
        pools.push(Pool(IERC20(tokenA), IERC20(tokenB), 0, 0, newLp));
    }

    function addLiquidity(
            uint pool,
            IERC20 tokenA,
            IERC20 tokenB,
            uint qtyA,
            uint qtyB
        ) public {
        Pool memory swapPool = pools[pool];

        { ... doing stuff here ... }

        uint lpTokensToMint = {...someNumber...};

        swapPool.lpToken.mint(msg.sender, lpTokensToMint); 
    }

    { ... }
}
