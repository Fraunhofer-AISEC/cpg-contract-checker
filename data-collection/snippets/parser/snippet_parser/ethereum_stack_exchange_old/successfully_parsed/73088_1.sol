function convertAtoB(uint amountA) returns (uint) {
  return totalB.mul(amountA).div(totalA);
}
