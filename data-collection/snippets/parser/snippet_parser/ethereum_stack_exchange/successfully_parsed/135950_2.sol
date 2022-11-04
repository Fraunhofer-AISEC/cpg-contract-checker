  function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) internal pure returns (uint amountOut) {
  require(amountIn > 0, 'PancakeLibrary: INSUFFICIENT_INPUT_AMOUNT');
  require(reserveIn > 0 && reserveOut > 0, 'PancakeLibrary: INSUFFICIENT_LIQUIDITY');
  uint amountInWithFee = amountIn.mul(9975);
  uint numerator = amountInWithFee.mul(reserveOut);
  uint denominator = reserveIn.mul(10000).add(amountInWithFee);
  amountOut = numerator / denominator;
}