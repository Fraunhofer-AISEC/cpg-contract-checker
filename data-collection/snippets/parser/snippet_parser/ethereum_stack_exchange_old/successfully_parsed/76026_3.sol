function mint(address account, uint256 amount) public onlyMinter returns (bool) {
    bytes memory empty = hex"00000000";
    _totalSupply = _totalSupply.add(amount);
    balances[msg.sender] = balances[msg.sender].add(amount);
    emit Transfer(address(0x0), msg.sender, amount, empty);
    return true;
}
