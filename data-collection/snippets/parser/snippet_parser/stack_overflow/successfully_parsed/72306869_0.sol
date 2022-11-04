 function withdraw(uint256 amount) external updateReward(msg.sender) nonReentrant {
        if (block.timestamp > 360) {
        s_totalSupply -= amount;
        s_balances[msg.sender] -= amount;
        emit WithdrewStake(msg.sender, amount);
        
        bool success = s_stakingToken.transfer(msg.sender, amount);
        if (!success) {
            revert TransferFailed(); 
        }}
    }
