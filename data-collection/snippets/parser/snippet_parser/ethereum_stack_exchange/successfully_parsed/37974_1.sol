function convertBytesToBytes8(bytes inBytes) returns (bytes8 outBytes8) {
    uint256 maxByteAvailable = inBytes.length < 8 ? inBytes.length : 8;
    for (uint256 i = 0; i < maxByteAvailable; i++) {
        bytes8 tempBytes8 = inBytes[i];
        tempBytes8 = tempBytes8 >> (8 * i);
        outBytes8 = outBytes8 | tempBytes8;
    }
}
