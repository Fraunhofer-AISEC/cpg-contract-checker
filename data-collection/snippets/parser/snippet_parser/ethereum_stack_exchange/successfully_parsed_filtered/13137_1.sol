function setByte(bytes16 x, uint8 i, byte b)  returns (bytes16) {
    bytes16 mask = bytes16(0xff) << i*8;
    return (x & ~mask) | (bytes16(b) >> (15-i)*8);
}
