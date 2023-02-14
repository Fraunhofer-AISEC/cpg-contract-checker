  function getFirst10() external view returns (uint256[10] memory) {
    uint256[10] chunk;
    for (uint32 j = 0; j < 10; j++) {
      chunk[j] = foo[j];
    }
    return chunk;
  }
