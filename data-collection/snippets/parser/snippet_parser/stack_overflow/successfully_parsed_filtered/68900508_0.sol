contract Test {
  uint256[100] private foo;

  function get() external view returns (uint256[100] memory) {
    return foo;               
  }
  function getFirst10() external view returns (uint256[10] memory) {
    return uint256[10](foo);  
  }
}
