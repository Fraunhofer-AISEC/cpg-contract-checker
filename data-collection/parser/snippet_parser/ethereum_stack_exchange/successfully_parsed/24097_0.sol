function test() {
    byte b = 0x2c;
    byte c;
    assembly {
        c := and(b, 0xf)
    }
    Check(c);
}
