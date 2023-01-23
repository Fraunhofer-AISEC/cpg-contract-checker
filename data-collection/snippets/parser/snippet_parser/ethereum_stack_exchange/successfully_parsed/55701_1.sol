
function mulScale (uint x, uint y, uint128 scale)
internal pure returns (uint) {
  uint a = x / scale;
  uint b = x % scale;
  uint c = y / scale;
  uint d = y % scale;

  return a * c * scale + a * d + b * c + b * d / scale;
}
