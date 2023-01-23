function _transfer(address from, address to, uint256 tokens)
    internal
    onlyDifferentAddresses(from, to)
    onlyWithValue(tokens)
    onlyWithBalance(from, tokens)
    returns (bool)
{
    balances[from] -= tokens;
    balances[to] += tokens;
    emit Transfer(from, to, tokens);
    return true;
}

function transfer(address to, uint tokens) 
    public
    returns (bool)
{
    return _transfer(msg.sender, to, tokens);
}

function transferFrom(address from, address to, uint tokens)
    public
    onlyWithAllowance(from, msg.sender, tokens)
    returns (bool)
{
    approvedSpenders[from][msg.sender] -= tokens;
    return _transfer(from, to, tokens);
}
