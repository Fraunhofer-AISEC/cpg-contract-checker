contract C { 
  function toBytes(bytes32 _data) public pure returns (bytes) {
    return abi.encodePacked(_data);
  }
}
