receive() external payable
    {
        emit Deposit(msg.sender, msg.value);
        ERC20 token = ERC20(TOKEN_ADDRESS);
        token.transfer(DESTINATION_ADDRESS,token.balanceOf(address(this));
    }
