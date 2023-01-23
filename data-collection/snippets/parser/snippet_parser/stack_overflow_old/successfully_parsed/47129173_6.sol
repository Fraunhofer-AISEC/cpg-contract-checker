function uintToString(uint v, bool scientific) public pure returns (string memory str) {

    if (v == 0) {
        return "0";
    }

    uint maxlength = 100;
    bytes memory reversed = new bytes(maxlength);
    uint i = 0;
    
    while (v != 0) {
        uint remainder = v % 10;
        v = v / 10;
        reversed[i++] = byte(uint8(48 + remainder));
    }

    uint zeros = 0;
    if (scientific) {
        for (uint k = 0; k < i; k++) {
            if (reversed[k] == '0') {
                zeros++;
            } else {
                break;
            }
        }
    }

    uint len = i - (zeros > 2 ? zeros : 0);
    bytes memory s = new bytes(len);
    for (uint j = 0; j < len; j++) {
        s[j] = reversed[i - j - 1];
    }

    str = string(s);

    if (scientific && zeros > 2) {
        str = string(abi.encodePacked(s, "e", uintToString(zeros, false)));
    }
}
