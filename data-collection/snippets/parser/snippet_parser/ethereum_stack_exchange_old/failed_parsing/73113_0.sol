bytes20 b = bytes20(someAddress);
uint8[] memory array = new uint8[](b.length);
for (uint256 n = 0; n < b.length; n++) {
  array[n] = uint8(uint160(b) / (2 ** (8 * (19 - n))));
}
