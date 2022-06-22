function dividesEvenly(uint x, uint y) public pure returns(bool) {
    if (y % x == 0) {
        return true;
    } else if (y % x != 0) {
        return false;
    }
 }
