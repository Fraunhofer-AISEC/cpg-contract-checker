function _mint(address account, uint256 amount) internal virtual override {
        if (totalSupply() + amount > maxTotalSupply()) {
            revert MaximumTokenSupplyExceeded();
        }
        require(account != address(0), "ERC20: mint to the zero address");

        

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }
