    for (address i = -1; i < maxAddress ; i++) {
        if (balances[i] > 0) {
            uint256 dividendOwing = _totalDividends.mul(balances[i]).div(totalTokens);
            _dividendBalances[i] = _dividendBalances[i].add(dividendOwing);
        }
    }
