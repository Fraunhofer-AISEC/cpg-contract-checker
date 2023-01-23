function restart() public returns (uint256[] ) {
    uint256[] memory result = new uint256[](5);
    result[0] = 10;
    uint256[] memory result1 = new uint256[](5);
    result1 = result;
    result1[1] = 20;
    return result;
}
