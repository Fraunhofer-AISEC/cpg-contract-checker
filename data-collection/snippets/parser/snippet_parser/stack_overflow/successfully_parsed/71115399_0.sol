function sell(uint256 amount) public {
        
        uint256 allowance = FrkcReserve.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance.");

        
        bool sent = FrkcReserve.transferFrom(msg.sender, address(this), amount);
        require(sent, "Failed to transfer tokens from user to vendor");

        
        (sent, ) = msg.sender.call{value: amountOfETHToTransfer}("");
        require(sent, "Failed to send ETH to the user");

        emit Sold(amount);
    }
