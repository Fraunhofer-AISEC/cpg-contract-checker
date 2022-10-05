function add(uint256 x, uint256 y)
    internal pure
    returns(uint256) {
        uint256 z = x + y;
        assert((z >= x) && (z >= y));
        return z;
    }
