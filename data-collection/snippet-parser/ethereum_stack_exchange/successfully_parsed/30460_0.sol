function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    

    
    

    
    

    
    

    totalSupply = totalSupply.add(_amount);
    if (totalSupply == SUPPLY_LIMIT) mintingFinished = true;

    balances[_to] = balances[_to].add(_amount);
    Mint(_to, _amount);
    Transfer(0x0, _to, _amount);

    assert(totalSupply <= SUPPLY_LIMIT);

    return true;
}
