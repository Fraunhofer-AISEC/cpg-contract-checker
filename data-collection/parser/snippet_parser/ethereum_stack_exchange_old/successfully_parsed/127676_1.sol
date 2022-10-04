function deposit(uint256 amount)
        external
        checkTokenBalance(msg.sender, amount)
    {
        if (!_isClosedForDeposit()) {
            _token.transferFrom(msg.sender, address(this), amount);
            deposits[msg.sender] += amount;
            totalDeposits += amount;
            _addToDepositors(msg.sender);
        } else {
            revert DepositPeriodExpired("Depost period has expired");
        }
    }
