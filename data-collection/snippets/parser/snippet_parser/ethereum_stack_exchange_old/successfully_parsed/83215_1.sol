function restart() public returns (uint256[] ) {
    uint256[] memory result = new uint256[](5);
    result[0] = 10;
    uint256[] memory result1 = new uint256[](5);

    for (uint i=0; i < 5; i += 1) {
        result1[i] = result[i];
    }

    result1[1] = 20;
    return result;
}
