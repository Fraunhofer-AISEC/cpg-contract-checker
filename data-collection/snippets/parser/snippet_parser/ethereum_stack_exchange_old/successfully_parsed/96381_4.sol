function avg(uint256 x, uint256 y) external view returns (uint256 result) {
    unchecked {
        result = (x >> 1) + (y >> 1) + (x & y & 1);
    }
}
