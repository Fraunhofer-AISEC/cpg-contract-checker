  function addPool(PoolInput calldata _pool, uint256[] calldata _groupIds,
    uint256[] calldata _issueNumberOffsets, uint256[] calldata _caps,
    Price[][] memory _prices) external hasValidPermit(UNIVERSAL, POOL) {

    updatePool(nextPoolId, _pool, _groupIds, _issueNumberOffsets, _caps,
      _prices);

    
    nextPoolId = nextPoolId.add(1);
  }
