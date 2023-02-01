function avg(uint256 x, uint256 y) external returns (uint256 result) {
    result = x / 2 + y / 2;
    if (x % 2 == 1 && y % 2 == 1) {
        result += 1;
    }
}
