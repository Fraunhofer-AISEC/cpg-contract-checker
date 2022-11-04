function _transfer(address from, address to, uint256 value) internal {
    require(to != address(0), "ERC20: transfer to the zero address");

    _balances[from] = _balances[from].sub(value);
    _balances[to] = _balances[to].add(value);
    emit Transfer(from, to, value);
}

function transfer(address to, uint256 value) public returns (bool) {
    _transfer(msg.sender, to, value);
    return true;
}

