 
 usdc.approve(address(pool), type(uint256).max);
 uint amt = 10*1e6;
 pool.exchange(1,2,amt,0);
