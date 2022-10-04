function reverse(uint32 input) internal pure returns (uint32 v) {
    v = input;

    
    v = ((v & 0xFF00FF00) >> 8) |
        ((v & 0x00FF00FF) << 8);

    
    v = (v >> 16) | (v << 16);
}
