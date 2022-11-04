function convertBytesToBytes8(bytes inBytes) returns (bytes8 outBytes8) {
    if (inBytes.length == 0) {
        return 0x0;
    }

    assembly {
        outBytes8 := mload(add(inBytes, 32))
    }
}
