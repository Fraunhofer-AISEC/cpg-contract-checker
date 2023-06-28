function avg(uint256 x, uint256 y) external view returns (uint256 result) {
    unchecked {
        result = (x >> 1) + (y >> 1);
        if (!(x & 1 == 0 || y & 1 == 0)) {
            result += 1;
        }
    }
}
