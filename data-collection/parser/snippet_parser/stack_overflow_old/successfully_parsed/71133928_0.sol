function sell(uint256 amount) public {
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        
        token.transferFrom(msg.sender, address(this), amount);
        payable(msg.sender).transfer(amount);
        
        emit Sold(amount);
    }
