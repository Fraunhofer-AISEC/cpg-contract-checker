function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
    uint8 i = 0;
    bytes memory bytesArray = new bytes(64);
    for (i = 0; i < bytesArray.length; i++) {

        uint8 _f = uint8(_bytes32[i/2] & 0x0f);
        uint8 _l = uint8(_bytes32[i/2] >> 4);

        bytesArray[i] = toByte(_f);
        i = i + 1;
        bytesArray[i] = toByte(_l);
    }
    return string(bytesArray);
}

function toByte(uint8 _uint8) public pure returns (byte) {
    if(_uint8 < 10) {
        return byte(_uint8 + 48);
    } else {
        return byte(_uint8 + 87);
    }
}
