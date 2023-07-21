  async estimateGas(transaction: any, _blockParam: string | null, requestId?: string) {
    const requestIdPrefix = formatRequestIdMessage(requestId);
    this.logger.trace(`${requestIdPrefix} estimateGas(transaction=${JSON.stringify(transaction)}, _blockParam=${_blockParam})`);
    
    if (transaction && transaction.to && (!transaction.data || transaction.data === '0x')) {
      const value = Number(transaction.value);
      if (value > 0) {
        const accountCacheKey = `${constants.CACHE_KEY.ACCOUNT}_${transaction.to}`;
        let toAccount: object | null = this.cache.get(accountCacheKey);
        if (!toAccount) {
          toAccount = await this.mirrorNodeClient.getAccount(transaction.to, requestId);
        }
​
        
        if (toAccount) {
          this.logger.trace(`${requestIdPrefix} caching ${accountCacheKey}:${JSON.stringify(toAccount)} for ${constants.CACHE_TTL.ONE_HOUR} ms`);
          this.cache.set(accountCacheKey, toAccount);
​
          return EthImpl.gasTxBaseCost;
        }
​
        return EthImpl.gasTxHollowAccountCreation;
      }
​
      return predefined.INVALID_PARAMETER(0, `Invalid 'value' field in transaction param. Value must be greater than 0`);
    } else {
      return this.defaultGas;
    }
  }
​
