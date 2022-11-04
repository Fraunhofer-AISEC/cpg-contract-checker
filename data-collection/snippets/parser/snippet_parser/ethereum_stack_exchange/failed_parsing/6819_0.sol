function toBytes(int x, int digits) returns (bytes b) {
    b = new bytes(digits);
    for (uint i = 0; i < digits; i++)
        b[i] = byte(uint8(uint(x));
}
