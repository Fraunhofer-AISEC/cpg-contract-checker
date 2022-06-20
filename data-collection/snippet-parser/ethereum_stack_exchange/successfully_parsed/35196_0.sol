function getHexString(bytes4 value) pure public returns (string) {
    bytes memory result = new bytes(8);
    string memory characterString = "0123456789abcdef";
    bytes memory characters = bytes(characterString);
    for (uint8 i = 0; i < 4; i++) {
        result[i * 2] = characters[uint256((value[i] & 0xF0) >> 4)];
        result[i * 2 + 1] = characters[uint256(value[i] & 0xF)];
    }
    return string(result);
}
