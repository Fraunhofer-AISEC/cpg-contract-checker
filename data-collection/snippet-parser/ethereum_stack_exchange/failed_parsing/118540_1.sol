function foo(uint num, uint den) public pure returns(uint result) {
  require(den != 0, "denominator cannot be zero")l
  result = num / den;
}
