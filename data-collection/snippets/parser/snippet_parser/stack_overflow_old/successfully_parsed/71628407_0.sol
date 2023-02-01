function getNextSqrtPriceFromAmount0RoundingUp(
       uint160 sqrtPX96,
       uint128 liquidity,
       uint256 amount,
       bool add
) internal pure returns (uint160) {
    
    if (amount == 0) return sqrtPX96;
    uint256 numerator1 = uint256(liquidity) << FixedPoint96.RESOLUTION;

    if (add) {
        uint256 product;
        if ((product = amount * sqrtPX96) / amount == sqrtPX96) {
            uint256 denominator = numerator1 + product;
            if (denominator >= numerator1)
                
                return uint160(FullMath.mulDivRoundingUp(numerator1, sqrtPX96, denominator));
        }

        return uint160(UnsafeMath.divRoundingUp(numerator1, (numerator1 / sqrtPX96).add(amount)));
    } 
}
