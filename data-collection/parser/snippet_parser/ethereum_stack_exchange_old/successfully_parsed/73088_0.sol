function convertBtoA(uint amountB) returns (uint) {
  return totalA.mul(amountB).div(totalB);
}
