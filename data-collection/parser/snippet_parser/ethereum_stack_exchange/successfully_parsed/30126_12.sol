function mostSignificantBit(uint256 x) pure public returns (uint8 r) {
    uint t;
    if ((t = (x >> 128)) > 0) { x = t; r += 128; }
    if ((t = (x >> 64)) > 0) { x = t; r += 64; }
    if ((t = (x >> 32)) > 0) { x = t; r += 32; }
    if ((t = (x >> 16)) > 0) { x = t; r += 16; }
    if ((t = (x >> 8)) > 0) { x = t; r += 8; }
    if ((t = (x >> 4)) > 0) { x = t; r += 4; }
    if ((t = (x >> 2)) > 0) { x = t; r += 2; }
    if ((t = (x >> 1)) > 0) { x = t; r += 1; }
}
