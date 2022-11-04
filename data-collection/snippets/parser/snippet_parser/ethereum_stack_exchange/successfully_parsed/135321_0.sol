    function isCoordsAdjacent(
        uint256 x1,
        uint256 y1,
        uint256 x2,
        uint256 y2
    ) public pure returns (bool) {
        unchecked {
            if (1 == ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))) {
                return true;
            } else {
                return false;
            }
        }
    }
