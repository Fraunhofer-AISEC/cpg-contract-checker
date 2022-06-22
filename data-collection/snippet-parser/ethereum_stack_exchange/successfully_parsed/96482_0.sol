function div_overflow() public pure returns (int16 result) {
    int16 x = type(int16).min;
    int16 y = -1;
    
    result = x / y;
}
