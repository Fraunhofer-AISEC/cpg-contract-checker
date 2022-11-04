function hashData (bytes32 data) public pure returns (bytes32) {
      bytes32 hash =  keccak256(data);
      return hash;
  }
