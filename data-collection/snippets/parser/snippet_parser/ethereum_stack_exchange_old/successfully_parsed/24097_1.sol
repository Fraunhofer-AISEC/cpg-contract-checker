function test() {
    byte b = 0x2c;
    byte mask = 0x0f;
    byte c;
    assembly {
        c := and(b, mask)
    }
    Check(c);
}
