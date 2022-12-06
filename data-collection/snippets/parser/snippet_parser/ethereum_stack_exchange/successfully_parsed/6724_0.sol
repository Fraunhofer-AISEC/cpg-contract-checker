uint teamRewardInTokens = uint((totalSupply / 85.0) * 15.0);
balances[teamRewardAccount] += teamRewardInTokens;
totalSupply += teamRewardInTokens;
