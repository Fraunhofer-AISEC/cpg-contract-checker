function char(byte b) returns (byte c) {
    if (b < 10) return byte(uint8(b) + 0x30);
    else return byte(uint8(b) + 0x57);
}


function bytes32string(bytes32 b32) returns (string out) {
    bytes memory s = new bytes(64);

    for (var i = 0; i < 32; i++) {
        byte b = byte(b32[i]);
        byte hi = byte(uint8(b) / 16);
        byte lo = byte(uint8(b) - 16 * uint8(hi));
        s[i*2] = char(hi);
        s[i*2+1] = char(lo);            
    }

    out = string(s);
}
