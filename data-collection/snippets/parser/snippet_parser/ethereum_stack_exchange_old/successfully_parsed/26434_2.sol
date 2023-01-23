function extractRSV(bytes sig) returns (string, string, string) {
    bytes memory r = new bytes(64);
    bytes memory s = new bytes(64);
    bytes memory v = new bytes(2);

    for (uint8 i = 0 ; i < 64 ; ++i) {
        r[i] = sig[i];
        s[i] = sig[i+64];
    }

    v[0] = sig[128];
    v[1] = sig[129];

    return (string(r), string(s), string(v));
}
