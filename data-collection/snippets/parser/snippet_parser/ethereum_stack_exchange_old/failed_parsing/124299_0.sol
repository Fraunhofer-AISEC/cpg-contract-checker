This function is from uniswap-v3/core/contracts/libraries/Oracle.sol






```
function lte(
    uint32 time,
    uint32 a,
    uint32 b
) private pure returns (bool) {
    
    if (a <= time && b <= time) return a <= b;

    uint256 aAdjusted = a > time ? a : a + 2**32;
    uint256 bAdjusted = b > time ? b : b + 2**32;

    return aAdjusted <= bAdjusted;
}
