function reverse(uint128 input) internal pure returns (uint128 v) {
    v = input;

    
    v = ((v & 0xFF00FF00FF00FF00FF00FF00FF00FF00) >> 8) |
        ((v & 0x00FF00FF00FF00FF00FF00FF00FF00FF) << 8);

    
    v = ((v & 0xFFFF0000FFFF0000FFFF0000FFFF0000) >> 16) |
        ((v & 0x0000FFFF0000FFFF0000FFFF0000FFFF) << 16);

    
    v = ((v & 0xFFFFFFFF00000000FFFFFFFF00000000) >> 32) |
        ((v & 0x00000000FFFFFFFF00000000FFFFFFFF) << 32);

    
    v = (v >> 64) | (v << 64);
}
