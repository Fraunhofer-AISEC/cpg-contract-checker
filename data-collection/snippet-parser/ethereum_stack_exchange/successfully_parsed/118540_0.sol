function foo(uint num, uint den) public pure returns(uint result) {
  if(den == 0) return 0; 
  result = num / den;
}
