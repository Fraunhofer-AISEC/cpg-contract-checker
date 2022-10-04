function concat (bytes16 a, bytes16 b) public pure returns (bytes32) {
  return bytes32 (uint256 (uint128 (a)) << 128 | uint128 (b));
}
