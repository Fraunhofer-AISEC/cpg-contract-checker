function test(uint256 a, uint256 b) public pure returns (int256 c) {
    c = (b >= a) ? int256(b - a) * 10 : int256(a - b) * -10;
}
