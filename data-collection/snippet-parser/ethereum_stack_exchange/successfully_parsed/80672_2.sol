function combine(bytes1 x, bytes1 y) private pure returns (uint8) {
    return uint8((uint16(x) + uint16(y)) * 9 / 8);
}
