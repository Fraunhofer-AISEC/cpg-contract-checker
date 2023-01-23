function addressToString(address _addr) public pure returns(string) {
    bytes32 value = bytes32(uint256(_addr));
    bytes memory alphabet = "0123456789abcdef";

    bytes memory str = new bytes(42);
    str[0] = '0';
    str[1] = 'x';
    for (uint i = 0; i < 20; i++) {
        str[2+i*2] = alphabet[uint(value[i + 12] >> 4)];
        str[3+i*2] = alphabet[uint(value[i + 12] & 0x0f)];
    }
    return string(str);
}
