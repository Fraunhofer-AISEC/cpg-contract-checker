function bytesToAddress(bytes memory b) public view returns (address) {
    uint256 result = 0;
    for (uint256 i = b.length - 1; i + 1 > 0; i--) {
        uint256 c = uint256(uint8(b[i]));

        uint256 to_inc = c * (16**((b.length - i - 1) * 2));
        result += to_inc;
    }
    return address(result);
