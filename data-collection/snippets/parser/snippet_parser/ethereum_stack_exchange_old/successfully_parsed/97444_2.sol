function lowestOrderDigitIsX(uint256 number, uint256 x) public pure returns (bool) {
    return number % 10 == x;
}
