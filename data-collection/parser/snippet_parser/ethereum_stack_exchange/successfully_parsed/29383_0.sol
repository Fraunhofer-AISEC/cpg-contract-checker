function testOverflow() returns(bool) {
    uint8 var1 = 255;
    uint8 var2 = 10;
    return var1 + var1 > 255;
}
