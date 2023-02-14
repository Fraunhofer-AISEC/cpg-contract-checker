PoolAddress.sol

  bytes32 internal constant POOL_INIT_CODE_HASH = 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54;


  function computeAddress(address factory, PoolKey memory key) internal view returns (address pool) {
    require(key.token0 < key.token1);
    pool = address(
      
      uint256(
        keccak256(
          abi.encodePacked(
            hex"ff",
            factory,
            keccak256(abi.encode(key.token0, key.token1, key.fee)),
            POOL_INIT_CODE_HASH
          )
        )
      )
      
    );
  }
