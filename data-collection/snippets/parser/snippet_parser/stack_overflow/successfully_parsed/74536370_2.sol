function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual override returns (bool) {

        uint256 fee = (amount.mul(percentage)).div(10000);
        uint256 total = amount.sub(fee);

        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, total);
        return true;
    }
