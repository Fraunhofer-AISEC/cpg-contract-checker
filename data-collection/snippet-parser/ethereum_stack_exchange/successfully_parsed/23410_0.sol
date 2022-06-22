uint256 unsold = balances[saleaddress];
balances[saleaddress] = 0;
balances[someLocation] += unsold;
