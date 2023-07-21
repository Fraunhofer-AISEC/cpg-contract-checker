function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
    _transfer(_msgSender(), recipient, amount);
    _applyFees(amount);
    return true;
}

function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
    _transfer(sender, recipient, amount);
    _applyFees(amount);
    _approve(sender, _msgSender(), allowance(sender, _msgSender()) - amount);
    return true;
}
