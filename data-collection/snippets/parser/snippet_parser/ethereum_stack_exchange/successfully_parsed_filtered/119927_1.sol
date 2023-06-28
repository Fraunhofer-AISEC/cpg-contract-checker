function transferFromERC20(
        address spender,
        address recepient,
        uint256 amount
    ) external {
        emit payment(spender, recepient);
        _approve(spender, recepient, amount);
        transferFrom(spender, recepient, amount);
    }

    function mint(address recepient, uint256 amount) external {
        _mint(recepient, amount);
    }
