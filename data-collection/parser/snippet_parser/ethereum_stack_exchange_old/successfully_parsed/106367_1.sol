  function blockValue() view public returns (uint256) {
      return uint256(blockhash(block.number - 1));
  }
