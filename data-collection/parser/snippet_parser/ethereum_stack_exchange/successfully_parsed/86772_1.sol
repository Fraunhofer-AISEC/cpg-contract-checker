function bytesToBytes32(bytes b, uint offset) private pure returns (bytes32) {
  bytes32 out;

  for (uint i = 0; i < 32; i++) {
    out[i] = b[offset + i];
  }
  return out;
}
