function withoutNames(uint x) pure returns (uint, uint) {
    uint y = 2 * x;
    uint z = 3 * x;
    return (y, z);
}

function withNames(uint x) pure returns (uint y, uint z) {
    y = 2 * x;
    z = 3 * x;
}
