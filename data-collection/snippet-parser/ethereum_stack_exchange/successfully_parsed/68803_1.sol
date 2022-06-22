function foo () public pure returns (uint) {
  uint x = 5;
  return x * x++; 
}
