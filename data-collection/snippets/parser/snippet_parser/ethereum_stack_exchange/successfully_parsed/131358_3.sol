function isNull(string memory val) internal pure returns (bool) {
  return bytes(val).length == 0;
}
