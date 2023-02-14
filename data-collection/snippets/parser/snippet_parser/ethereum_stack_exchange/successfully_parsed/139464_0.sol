function quoteExactInputSingle(
    address tokenIn,
    address tokenOut,
    uint24 fee,
    uint256 amountIn,
    uint160 sqrtPriceLimitX96
) public override returns (uint256 amountOut) {
    bool zeroForOne = tokenIn < tokenOut;

    try
        getPool(tokenIn, tokenOut, fee).swap(
            address(this), 
            zeroForOne,
            amountIn.toInt256(),
            sqrtPriceLimitX96 == 0
                ? (zeroForOne ? TickMath.MIN_SQRT_RATIO + 1 : TickMath.MAX_SQRT_RATIO - 1)
                : sqrtPriceLimitX96,
            abi.encodePacked(tokenIn, fee, tokenOut)
        )
    {} catch (bytes memory reason) {
        return parseRevertReason(reason);
    }
}
