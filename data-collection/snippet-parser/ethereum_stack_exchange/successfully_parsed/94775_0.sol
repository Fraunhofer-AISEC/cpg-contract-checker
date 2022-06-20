function transfer(address sender, address receiver, uint256 numTokens) public returns (bool) 
{
    require(numTokens <= balances[admin]);
    balances[admin] = balances[admin].sub(numTokens);
    balances[receiver] = balances[receiver].add(numTokens);
    emit Transfer(admin, receiver, numTokens);
    return true;
}
