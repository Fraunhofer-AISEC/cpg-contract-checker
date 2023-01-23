PoolStruct memory pool;

pool = PoolStruct({
  currentUserID: 1,
  activeUserID: 1,
  price: POOL_PRICES[i],
  minimalReferrals: POOL_MINIMAL_REFERRALS[i]
});

pool.poolUserList[1] = msg.sender;
