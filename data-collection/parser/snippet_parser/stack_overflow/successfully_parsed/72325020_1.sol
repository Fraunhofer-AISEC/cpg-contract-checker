function div128x128 (uint256 x, uint256 y) internal pure returns (uint256) {
    unchecked {
        require (y != 0);

        uint256 xInt = x>>128;
        uint256 xDecimal = x<<128;
        uint256 yInt = y>>128;
        uint256 yDecimal = y<<128;

        uint256 hi = ((uint256(xInt) << 64)/yInt)<<64;
        uint256 lo = ((uint256(xDecimal)<<64)/yDecimal);
        
        require (hi+lo <= MAX_128x128);
        return hi+lo;
    }
}
