function isPowerOfTen(uint256 x) external view returns (bool result) {
    while (x > 9 && x % 10 == 0) {
        x /= 10;
    }
    result = x == 1;
}
