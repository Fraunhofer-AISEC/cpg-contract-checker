function hasher(bytes memory value) external pure returns(bytes32) {
  return keccak256(bytes(value));
}


