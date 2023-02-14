function sign(int256 x) external pure returns (int8) {
    return int8(((0 < x) ? 1 : 0) - ((x < 0) ? 1 : 0 ));
}
