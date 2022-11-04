function bytesToAddr (bytes b) constant returns (address) {
  uint result = 0;
  for (uint i = b.length-1; i+1 > 0; i--) {
    uint c = uint(b[i]);
    uint to_inc = c * ( 16 ** ((b.length - i-1) * 2));
    result += to_inc;
  }
  return address(result);
}
