function withdraw(uint withdrawAmount) public returns (uint remainingBal) {
    
    if (withdrawAmount <= balances[msg.sender]) {
        balances[msg.sender] -= withdrawAmount;
        msg.sender.transfer(withdrawAmount);
    }
    return balances[msg.sender];
}
