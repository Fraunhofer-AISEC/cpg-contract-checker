



function mostSignificantBit(uint256 x) internal pure returns (uint256 msb) {
    if (x >= 2**128) {
        x >>= 128;
        msb += 128;
    }
    if (x >= 2**64) {
        x >>= 64;
        msb += 64;
    }
    if (x >= 2**32) {
        x >>= 32;
        msb += 32;
    }
    if (x >= 2**16) {
        x >>= 16;
        msb += 16;
    }
    if (x >= 2**8) {
        x >>= 8;
        msb += 8;
    }
    if (x >= 2**4) {
        x >>= 4;
        msb += 4;
    }
    if (x >= 2**2) {
        x >>= 2;
        msb += 2;
    }
    if (x >= 2**1) {
        
        msb += 1;
    }
}













function log2(int256 x) internal pure returns (int256 result) {
    require(x > 0);
    unchecked {
        
        int256 sign;
        if (x >= SCALE) {
            sign = 1;
        } else {
            sign = -1;
            
            assembly {
                x := div(1000000000000000000000000000000000000, x)
            }
        }

        
        uint256 n = mostSignificantBit(uint256(x / SCALE));

        
        
        result = int256(n) * SCALE;

        
        int256 y = x >> n;

        
        if (y == SCALE) {
            return result * sign;
        }

        
        
        for (int256 delta = int256(HALF_SCALE); delta > 0; delta >>= 1) {
            y = (y * y) / SCALE;

            
            if (y >= 2 * SCALE) {
                
                result += delta;

                
                y >>= 1;
            }
        }
        result *= sign;
    }
}
