function Foo (uint _num) external pure returns(bool {
  uint externalResult = externalCall(_num);
  if(externalResult == 15) {
    return true;
  }
  return false;
}
