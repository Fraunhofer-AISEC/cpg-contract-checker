contract Test {
  bytes32[] hashes;

  function extCall(bytes _data) external view {
    bytes32 hash = keccak256(_data);
    _intCall(hash);
  }

  function _intCall(bytes32 _hash) private {
    hashes.push(_hash)
  }
}
