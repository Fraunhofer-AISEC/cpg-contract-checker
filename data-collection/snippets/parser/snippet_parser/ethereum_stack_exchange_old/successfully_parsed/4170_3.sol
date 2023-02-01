function toBytes(uint256 x) returns (bytes b) {
    b = new bytes(32);
    for (uint i = 0; i < 32; i++) {
        b[i] = byte(uint8(x / (2**(8*(31 - i))))); 
    }
}
