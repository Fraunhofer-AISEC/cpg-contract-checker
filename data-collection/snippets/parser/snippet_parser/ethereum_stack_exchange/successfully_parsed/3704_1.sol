function extract(bytes data, uint pos) returns (bytes20) {
    uint160 subdata = 0;
    for (uint160 i = 0; i < 20; i++) {
        subdata += uint160(data[i + pos]) * 2 ** (8 * (19 - i));
    }
    return bytes20(subdata);
}
