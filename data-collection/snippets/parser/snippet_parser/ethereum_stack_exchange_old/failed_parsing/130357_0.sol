function deposit(uint256 _amount) external {
        require(_amount > 0, "The amount should be greater than 0");
        require(usdcContract.balanceOf(msg.sender) >= _amount, "The USDC balance should be at least the specified amount");
        require(usdcContract.transferFrom(msg.sender, address(this), _amount), "Transaction declined by user");
        ...
        addressToFunds[msg.sender] += _amount;
