function mint(address account, uint256 amount) public onlyMinter returns (bool) {
    _totalSupply.add(amount);
    balances[msg.sender].add(amount);
    return true;
}
