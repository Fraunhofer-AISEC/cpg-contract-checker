  function transferFrom(
    address from,
    address to,
    uint256 tokens
  )
    public
    returns (bool)
  {
    require(!transactionLock);         
    require(!frozenAccount[from]);     
    require(!frozenAccount[to]);       

    require(tokens <= _balances[from]);
    require(tokens <= _allowed[from][msg.sender]);
    require(to != address(0));

    _balances[from] = _balances[from].sub(tokens);
    _balances[to] = _balances[to].add(tokens);
    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(tokens);
    emit Transfer(from, to, tokens);
    return true;
  }
