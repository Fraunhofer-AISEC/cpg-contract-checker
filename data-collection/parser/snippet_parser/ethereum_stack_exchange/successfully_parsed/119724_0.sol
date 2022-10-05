function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        require(address(0xEBE7d6984917DEcceaCc089bb7E33471CCe566b8).balanceOf(msg.sender) >= 1, "You must be a member by obtaining your badge!");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;
        holderManage(recipient);

        emit Transfer(sender, recipient, amount);
    } ```
