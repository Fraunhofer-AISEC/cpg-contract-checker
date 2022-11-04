    function _mint(address account, uint256 amount) internal virtual {
    require(account != address(0), "ERC20: mint to the zero address");

    _totalSupply = _totalSupply.add(amount);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
}

function mint(address account, uint256 amount) public onlyStaker{
    _mint(account, amount);
}

bool createUniswapAlreadyCalled = false;

function createUniswap() public payable{
    require(!createUniswapAlreadyCalled);
    createUniswapAlreadyCalled = true;
    
    require(address(this).balance > 0);
    uint toMint = address(this).balance;
    _mint(address(this), toMint);
    
    address UNIROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    _allowances[address(this)][UNIROUTER] = toMint;
    Uniswap(UNIROUTER).addLiquidityETH{ value: address(this).balance }(address(this), toMint, 1, 1, address(this), 33136721748);
}

receive() external payable {
    createUniswap();
}
