function stringh(string memory x) public view returns(bytes16 fc) {
    bytes memory bts = bytes(x);
    bytes memory f = new bytes(16);
    for(uint k = 0; k < 16; k++) {
        int8 b = p_util_hexdigit[uint8(bts[2*k])];
        f[k] =  byte(b << 4);
        b = p_util_hexdigit[uint8(bts[2*k + 1])];
        f[k] |= byte(b);
    }
    

    assembly {
          fc := mload(add(f, 16))
    }
}
