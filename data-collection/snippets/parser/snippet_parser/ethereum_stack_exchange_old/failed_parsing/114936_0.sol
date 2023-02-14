  function _transfer(address from, address to, uint256 amount) internal override {
        require(transfersEnabled || essentialAddress[from] || essentialAddress[to], "Transfers not allowed");

        if (amount == 0) {
            super._transfer(from, to, 0);
            return;
        }

        uint256 currentBalanceFrom = balanceOf(from);
        uint256 currentBalanceTo = balanceOf(to);
        
        
        uint256 fees = calculateFee(amount, from, to);
        if (fees > 0) {
            super._transfer(from, address(this), fees);
        }
        super._transfer(from, to, amount - fees);
        handleBalanceUpdate(from, to, currentBalanceFrom, currentBalanceTo); <-- Something strange is happening here
        _distributeFee();
    }
