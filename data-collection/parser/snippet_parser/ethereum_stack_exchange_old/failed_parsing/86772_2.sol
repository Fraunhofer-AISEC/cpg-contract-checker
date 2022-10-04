uint res;

for (uint i = 0; i < 32; i++) {
    res += uint8(b[i]) * (256 ** i);
}
