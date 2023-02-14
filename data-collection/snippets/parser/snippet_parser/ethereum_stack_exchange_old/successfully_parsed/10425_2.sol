




function fracExp(uint k, uint q, uint n, uint p) returns (uint) {
  uint s = 0;
  uint N = 1;
  uint B = 1;
  for (uint i = 0; i < p; ++i){
    s += k * N / B / (q**i);
    N  = N * (n-i);
    B  = B * (i+1);
  }
  return s;
}
