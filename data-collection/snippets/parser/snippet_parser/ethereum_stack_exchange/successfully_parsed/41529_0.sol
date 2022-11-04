function test() public pure returns (uint256) {
    uint256 amount = 10 * 10**18;
    uint256 price = 0.5 * 10**18;

    assert(amount / price == 20);
}
