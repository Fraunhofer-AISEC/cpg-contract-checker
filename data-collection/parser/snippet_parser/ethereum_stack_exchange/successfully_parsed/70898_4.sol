function mulFixed (uint x, uint y) internal pure returns (uint z) {
  uint a = x / 10**18;
  uint b = x % 10**18;
  uint c = y / 10**18;
  uint d = y % 10**18;
  return a * c * 10**18 + a * d + b * c + b * d / 10**18;
}
