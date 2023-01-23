function testCoords(uint256[] calldata x, uint256[] calldata y) public view returns (bool) {

    for (uint256 i = 0; i < coords.length; i++) {
        for (uint256 j = 0; j < coords.length; j++) {

            if (
                isCoordsAdjacent(x, y, x, y - 1)
                isCoordsAdjacent(x, y, (x - 1), y) ||
                isCoordsAdjacent(x, y, (x - 1), (y + 1)) ||
                isCoordsAdjacent(x, y, x, (y - 1)) ||
                isCoordsAdjacent(x, y, x, y) ||
                isCoordsAdjacent(x, y, x, y + 1) ||
                isCoordsAdjacent(x, y, (x + 1), (y - 1)) ||
                isCoordsAdjacent(x, y, (x + 1), y) ||
                isCoordsAdjacent(x, y, (x + 1), (y + 1))
            ) {
                return true;
            }
        }
    }
    return false;
}
