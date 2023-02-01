function withdraw(uint withdrawAmount) public returns (uint) {
            assert(balances[msg.sender] >= withdrawAmount);
            balances[owner] -= withdrawAmount;
            emit LogWithdrawal(msg.sender, withdrawAmount, balances[msg.sender]);
            return balances[msg.sender];
    }
