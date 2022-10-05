function withdraw(uint withdrawAmount) public returns (uint) {
        require(balances[msg.sender]>= withdrawAmount);
        balances[msg.sender] -= withdrawAmount;
        emit LogWithdrawal(msg.sender,
        withdrawAmount,balances[msg.sender]);
        return balances[msg.sender];
        }
}
