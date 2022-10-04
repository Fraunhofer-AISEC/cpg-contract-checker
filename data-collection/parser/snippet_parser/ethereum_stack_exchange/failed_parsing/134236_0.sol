unchecked{_approve(owner, spender, currentAllowance - subtractedValue);
unchecked {_balances[from] = fromBalance - amount; _balances[to] += amount;}
unchecked {_balances[account] += amount;}
unchecked {_balances[account] = accountBalance - amount; _totalSupply -= amount;}
unchecked {_approve(owner, spender, currentAllowance - amount);}
