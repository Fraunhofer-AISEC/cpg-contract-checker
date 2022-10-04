function isPowerOfTen(uint256 x) external view returns (bool result) {
    result = x == 10**0 || x == 10**1 || x == 10**2 || x == 10**3 || x == 10**4 || x == 10**5;
}
