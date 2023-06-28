function getTest2() constant returns (uint16) {
  uint256 number = 0x1ceeb282f22d09352d03c2e9a5e43b4a63fafbeb1424622fef8e390df493030e;
  return uint16(number & 0xff);
}
