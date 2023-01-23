function testInvalidJumpLocation() public constant returns (uint[5]) {
  uint[5] memory data;
  uint j = 1;
  j = j - 2;
  data[j] = 1235;
  return data;
}
