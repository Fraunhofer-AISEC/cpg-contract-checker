function hashHelper(uint value) public pure returns(bytes32 hash) {
  return keccak256(value);
}
