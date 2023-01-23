function isContract(address addr) returns (bool) {
  uint size;
  assembly { size := extcodesize(addr) }
  return size > 0;
}
