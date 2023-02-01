 function hashData (bytes32 data) public constant returns (bytes32) {
      var hash =  keccak256(data);
      return hash;
  }
