NonfungiblePositionManager.sol

function mint(MintParams calldata params)
    external
    payable
    override
    checkDeadline(params.deadline)
    returns (
      uint256 tokenId,
      uint128 liquidity,
      uint256 amount0,
      uint256 amount1
    )
  {
    IUniswapV3Pool pool;
    


---> (liquidity, amount0, amount1, pool) = addLiquidity(
      AddLiquidityParams({
        token0: params.token0,
        token1: params.token1,
        fee: params.fee,
        recipient: address(this),
        tickLower: params.tickLower,
        tickUpper: params.tickUpper,
        amount0Desired: params.amount0Desired,
        amount1Desired: params.amount1Desired,
        amount0Min: params.amount0Min,
        amount1Min: params.amount1Min
      })
    );
    

    _mint(params.recipient, (tokenId = _nextId++));

    bytes32 positionKey = PositionKey.compute(address(this), params.tickLower, params.tickUpper);
    (, uint256 feeGrowthInside0LastX128, uint256 feeGrowthInside1LastX128, , ) = pool.positions(positionKey);
    
    
    uint80 poolId = cachePoolKey(
      address(pool),
      PoolAddress.PoolKey({token0: params.token0, token1: params.token1, fee: params.fee})
    );
    
    _positions[tokenId] = Position({
      nonce: 0,
      operator: address(0),
      poolId: poolId,
      tickLower: params.tickLower,
      tickUpper: params.tickUpper,
      liquidity: liquidity,
      feeGrowthInside0LastX128: feeGrowthInside0LastX128,
      feeGrowthInside1LastX128: feeGrowthInside1LastX128,
      tokensOwed0: 0,
      tokensOwed1: 0
    });
    
    emit IncreaseLiquidity(tokenId, liquidity, amount0, amount1);
  }
