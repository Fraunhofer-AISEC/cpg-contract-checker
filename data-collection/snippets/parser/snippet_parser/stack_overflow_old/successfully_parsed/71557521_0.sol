contract Test is ERC20Pausable, AccessControl {
    address private uniswapV2Pair;
    uint256 public tax;
    constructor(string memory __name, string memory __symbol, address _owner, uint8 __decimal, uint256 _totalSup, uint256 _tax)
    ERC20(__name, __symbol, _owner, __decimal, _totalSup) {
        tax = _tax;
        _grantRole(DEFAULT_ADMIN_ROLE, _owner);
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), _uniswapV2Router.WETH());
 
    }
 
    function setTax(uint256 _tax) external onlyRole(DEFAULT_ADMIN_ROLE) {
        tax = _tax;
    }
 
    function pause() external onlyRole(DEFAULT_ADMIN_ROLE) {
        _pause();
    }
 
    function unpause() external onlyRole(DEFAULT_ADMIN_ROLE) {
        _unpause();
    }
 
 
    function burn(uint256 amount) external {
        _burn(_msgSender(), amount);
    }
 
    function _transfer(address sender, address recipient, uint256 amount) internal override(ERC20) {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
 
        _beforeTokenTransfer(sender, recipient, amount);
        if (recipient == uniswapV2Pair && balanceOf(uniswapV2Pair) > 0) {
            uint256 preAmount = amount;
            amount = amount * (1000 - tax) / 1000;
            _balances[address(uint160(charityFee))] += preAmount - amount;
            emit Transfer(sender, address(uint160(charityFee)), preAmount - amount);
        }
 
        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
    unchecked {
        _balances[sender] = senderBalance - amount;
    }
        _balances[recipient] += amount;
 
        emit Transfer(sender, recipient, amount);
 
        _afterTokenTransfer(sender, recipient, amount);
    }
 
}
