function hashHelper(address a, bytes32 b, uint c) public pure returns(bytes32) {
  return ... 
}

function commit(bytes32 hash) public pure {
  
}

function reveal (address a, bytes32 b, uint c) public {
  require(hashHelper(a,b,c) == hash, "Invalid Hash inputs");
}
