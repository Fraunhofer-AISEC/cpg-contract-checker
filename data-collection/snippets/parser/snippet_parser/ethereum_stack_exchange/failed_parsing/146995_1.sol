
function flashLiquidate(FlashLiquidateParams memory params) external override {
        ...
        
        vars.poolKey = PoolAddress.getPoolKey({
            tokenA: address(params.collateral),
            tokenB: address(vars.underlying),
            fee: params.poolFee
        });

        vars.zeroForOne = address(vars.underlying) == vars.poolKey.token1;

        IUniswapV3Pool(poolFor(vars.poolKey)).swap({
            
            recipient: address(this),
            
            zeroForOne: vars.zeroForOne,
            
            amountSpecified: int256(params.underlyingAmount) * -1,
            
            
            sqrtPriceLimitX96: vars.zeroForOne ? MIN_SQRT_RATIO + 1 : MAX_SQRT_RATIO - 1,
            
            data: abi.encode(
                UniswapV3SwapCallbackParams({
                    bond: params.bond,
                    borrower: params.borrower,
                    collateral: params.collateral,
                    poolKey: vars.poolKey,
                    sender: msg.sender,
                    turnout: params.turnout,
                    underlyingAmount: params.underlyingAmount
                })
            )
        });
}

