function calculateBancorTotalSupply (
  uint etherAmount,
  uint reserveRatio,
  uint slope,
  uint scale)
public view returns (uint) {
  uint256 result;
  uint8 precision;
  uint256 baseN = etherAmount * scale * scale;
  uint256 baseD = reserveRatio * slope;
  uint256 expN = reserveRatio;
  uint256 expD = scale;
  (result, precision) = power(baseN, baseD, uint32 (expN), uint32 (expD));
  return result >> precision;
}
