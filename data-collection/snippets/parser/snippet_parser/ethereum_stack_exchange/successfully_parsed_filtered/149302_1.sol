function approve(address spender, uint256 amount) public notPaused override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
