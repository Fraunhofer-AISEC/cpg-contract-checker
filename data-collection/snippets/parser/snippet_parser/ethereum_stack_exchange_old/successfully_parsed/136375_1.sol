function checkNegativeUnary(uint8 x) external pure returns (bool result) {
    uint8 a = -x;
    uint8 b = type(uint8).max - x + 1;
    result = a == b;
}
