    function deposit(uint256 amount) public {
        require(tokenContract.balanceOf(msg.sender) >= amount, "Sender has not enough balance");
        require(tokenContract.allowance(msg.sender, address(this)) >= amount, "Contract is not allowed to transfer tokens");
        require(tokenContract.transferFrom(msg.sender, address(this), amount) == true, "Could not send tokens from the buyer");
    }
