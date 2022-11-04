function test() public pure returns (uint256[] memory) {
    UD60x18[] memory foo = new UD60x18[](2);
    foo[0] = UD60x18.wrap(1);
    foo[1] = UD60x18.wrap(2);
    return unwrapArray(foo); 
}
