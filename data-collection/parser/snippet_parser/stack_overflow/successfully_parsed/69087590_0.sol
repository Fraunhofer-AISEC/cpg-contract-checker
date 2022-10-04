function sqrt(uint256 y) public pure returns (uint256) {
    if (y > 3) {
        uint256 z = y;
        uint256 x = y / 2 + 1;
        while (x < z) {
            z = x;
            x = (y / x + x) / 2;
        }
        return z;
    } else if (y != 0) {
        return 1;
    } else {
        return 0;
    }
}

function sqrtTest(uint8 y) public pure returns (uint256) {
    return sqrt(y);
} 
