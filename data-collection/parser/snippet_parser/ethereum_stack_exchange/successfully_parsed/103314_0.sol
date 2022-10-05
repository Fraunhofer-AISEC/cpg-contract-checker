function mul(uint256 x, uint256 y) internal pure returns (uint256 z) {
    require(x == 0 || (z = x * y) / x == y);
}
