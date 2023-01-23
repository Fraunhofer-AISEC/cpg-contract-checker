function checker(bytes calldata _data) external pure returns (bool) {
  return keccak256(_data) == keccak256(abi.encodePacked("SOMETHING"));
}
