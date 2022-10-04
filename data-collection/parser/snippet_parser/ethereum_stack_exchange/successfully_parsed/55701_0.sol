pragma solidity 0.4.24;
contract PercentageCalc {
  uint128 public bp = 185; 

  function calculatePercentage(
    uint128 theNumber
  )
  public
  view
  returns (uint128) {
    return uint128(int256(theNumber) / int256(10000) * int256(bp));
  }
}
