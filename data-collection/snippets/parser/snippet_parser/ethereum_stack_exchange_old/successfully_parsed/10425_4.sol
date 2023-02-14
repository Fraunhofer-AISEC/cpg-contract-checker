
uint256 internal constant SCALE = 1e18;


uint256 internal constant SCALE_LPOTD = 262144;


uint256 internal constant SCALE_INVERSE = 78156646155174841979727994598816262306175212592076161876661508869554232690281;



















function mulDivFixedPoint(uint256 x, uint256 y) internal pure returns (uint256 result) {
    uint256 prod0;
    uint256 prod1;
    assembly {
        let mm := mulmod(x, y, not(0))
        prod0 := mul(x, y)
        prod1 := sub(sub(mm, prod0), lt(mm, prod0))
    }

    uint256 remainder;
    uint256 roundUpUnit;
    assembly {
        remainder := mulmod(x, y, SCALE)
        roundUpUnit := gt(remainder, 499999999999999999)
    }

    if (prod1 == 0) {
        unchecked {
            result = (prod0 / SCALE) + roundUpUnit;
            return result;
        }
    }

    require(SCALE > prod1);

    assembly {
        result := add(
            mul(
                or(
                    div(sub(prod0, remainder), SCALE_LPOTD),
                    mul(sub(prod1, gt(remainder, prod0)), add(div(sub(0, SCALE_LPOTD), SCALE_LPOTD), 1))
                ),
                SCALE_INVERSE
            ),
            roundUpUnit
        )
    }
}
















function pow(uint256 x, uint256 y) internal pure returns (uint256 result) {
    
    result = y & 1 > 0 ? x : SCALE;

    
    for (y >>= 1; y > 0; y >>= 1) {
        x = mulDivFixedPoint(x, x);

        
        if (y & 1 > 0) {
            result = mulDivFixedPoint(result, x);
        }
    }
}
