function totalSupply()  public view returns (uint256) {
    return _totalSupply;
}

function symbol() public view returns (string memory) {
    return _symbol;
}

function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
}

function transfer(address recipient, uint256 amount)  public returns (bool) {
    _transfer(address(this), recipient, amount);
    return true;
}

function allowance(address owner, address spender)  public view returns (uint256) {
    return _allowances[owner][spender];
}

function approve(address spender, uint256 amount) public returns (bool) {
    _approve(_msgSender(), spender, amount);
    return true;
}

function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
    _transfer(sender, recipient, amount);
    _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
    return true;
}

function _transfer(address sender, address recipient, uint256 amount) internal {
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");

    _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balanceee");
    _balances[recipient] = _balances[recipient].add(amount);
    emit Transfer(sender, recipient, amount);
}

function _approve(address owner, address spender, uint256 amount) internal {
    require(owner != address(0), "ERC20: approve from the zero address");
    require(spender != address(0), "ERC20: approve to the zero address");

    _allowances[owner][spender] = amount;
    emit Approval(owner, spender, amount);
}
