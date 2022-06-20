uint256 constant ONE = 1;

function floorLog(uint256 n) pure returns (uint8) {
    uint8 res = 0;

    if (n < 256) {
        
        while (n > 1) {
            n >>= 1;
            res += 1;
        }
    }
    else {
        
        for (uint8 s = 128; s > 0; s >>= 1) {
            if (n >= (ONE << s)) {
                n >>= s;
                res |= s;
            }
        }
    }

    return res;
}
