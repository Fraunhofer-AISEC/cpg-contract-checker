struct uint512 {
    uint256 hi;
    uint256 lo;
}

function eq(uint512 x, uint512 y) internal pure returns (bool) {
    return x.hi == y.hi && x.lo == y.lo;
}

function lt(uint512 x, uint512 y) internal pure returns (bool) {
    return x.hi < y.hi || (x.hi == y.hi && x.lo < y.lo);
}

function gt(uint512 x, uint512 y) internal pure returns (bool) {
    return x.hi > y.hi || (x.hi == y.hi && x.lo > y.lo);
}
