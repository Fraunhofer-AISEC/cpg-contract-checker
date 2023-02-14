    function testCoords(uint256[] calldata x, uint256[] calldata y)
        public
        pure
        returns (bool result)
    {
        unchecked {
            for (uint256 i = 0; i < x.length; i++) {
                for (uint256 j = 0; j < y.length; j++) {
                    if (i == j) {
                        continue;
                    } else if (isCoordsAdjacent(x[i], y[i], x[j], y[j])) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        }
    }
