function calculateBancorTotalSupply (
  uint etherAmount,
  uint reserveRatio,
  uint slope,
  uint scale)
public pure returns (uint) {
  bytes16 scaleQuad = ABDKMathQuad.fromUInt (scale);

  bytes16 reserveRatioQuad = ABDKMathQuad.div (
    ABDKMathQuad.fromUInt (reserveRatio),
    scaleQuad);

  bytes16 slopeQuad = ABDKMathQuad.div (
    ABDKMathQuad.fromUInt (slope),
    scaleQuad);

  return ABDKMathQuad.toUInt (
    ABDKMathQuad.pow_2 (
      ABDKMathQuad.mul (
        ABDKMathQuad.log_2 (
          ABDKMathQuad.div (
            ABDKMathQuad.fromUInt (etherAmount),
            ABDKMathQuad.mul (reserveRatioQuad, slopeQuad))),
        reserveRatioQuad)));
}
