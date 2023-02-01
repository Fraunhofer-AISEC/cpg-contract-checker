contract TestIntToString {
  function getSha256(string str) external pure returns (bytes32) {
    bytes32 hash = sha256(abi.encodePacked(str));

    return hash;
    
    }
}
