function reverse(bytes8 input) external pure returns (bytes8 v) {
    v = input;

    
    v = ((v & 0x0F0F0F0F0F0F0F0F) << 4) | 
        ((v & 0xF0F0F0F0F0F0F0F0) >> 4);

    
    v = ((v & 0xFF00FF00FF00FF00) >> 8) |
        ((v & 0x00FF00FF00FF00FF) << 8);

    
    v = ((v & 0xFFFF0000FFFF0000) >> 16) |
        ((v & 0x0000FFFF0000FFFF) << 16);

    
    v = (v >> 32) | (v << 32);
}

