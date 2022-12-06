function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
    totalSupply = SafeMath.add(totalSupply, _amount);
    balances[_to] = balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(0x0, _to, _amount);
    return true;
}
