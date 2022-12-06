function pack (int16 a, int16 b) public pure returns (bytes32) {
  return bytes32 (bytes2 (a)) >> 16 | bytes2 (b);
}

function unpack (bytes32 x) public pure returns (int16, int16) {
  return (int16 (bytes2 (x << 16)), int16 (bytes2 (x)));
}
