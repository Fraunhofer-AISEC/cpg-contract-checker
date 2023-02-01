    function splitPayment(address from, address firstReceiver, address secondReceiver, uint256 amount) public {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(firstReceiver != address(0), "ERC20: transfer to the zero address");
        require(secondReceiver != address(0), "ERC20: transfer to the zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");

        unchecked {
            _balances[from] = fromBalance - amount;
        }

        _balances[firstReceiver] += amount * 70 / 100;
        _balances[secondReceiver] += amount * 30 / 100;

        emit SplittedTransfer(from, firstReceiver, secondReceiver, amount);
    }
