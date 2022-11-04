function hashHelper(string data) public pure returns(bytes32 hash) {
  return keccack256(data);
}
