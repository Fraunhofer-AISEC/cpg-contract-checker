uint8 constant PRECISION = 127;
uint256 constant FIXED_1 = 0x080000000000000000000000000000000; 
uint256 constant FIXED_2 = 0x100000000000000000000000000000000; 
uint256 constant MAX_NUM = 0x1ffffffffffffffffffffffffffffffff; 

function log(uint256 numerator, uint256 denominator) pure returns (uint256) {
    uint256 res = 0;

    assert(numerator <= MAX_NUM);
    uint256 x = numerator * FIXED_1 / denominator;

    
    if (x >= FIXED_2) {
        uint8 count = floorLog(x / FIXED_1);
        x >>= count; 
        res = count * FIXED_1;
    }

    
    if (x > FIXED_1) {
        for (uint8 i = PRECISION; i > 0; --i) {
            x = (x * x) / FIXED_1; 
            if (x >= FIXED_2) {
                x >>= 1; 
                res += ONE << (i - 1);
            }
        }
    }

    return res;
}
