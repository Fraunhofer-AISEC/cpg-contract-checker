function div64x64 (uint128 x, uint128 y) internal pure returns (uint128) {
    unchecked {
        require (y != 0);
    
        uint256 answer = (uint256 (x) << 64) / y;

        require (answer <= 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        return uint128 (answer);
    }
}
