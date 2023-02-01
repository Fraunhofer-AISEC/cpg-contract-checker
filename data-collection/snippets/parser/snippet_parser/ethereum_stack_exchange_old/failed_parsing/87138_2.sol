function s1(uint8 c) internal pure returns (uint) {
  if (c == 37 || c == 43 || c == 45 || c == 46 || ...) {
    return 2;
  }

  return 0;
}
