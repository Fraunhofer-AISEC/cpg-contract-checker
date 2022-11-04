function() public payable {
    balances[msg.sender] += msg.value;
    LogDeposit(msg.sender, msg.value);
} 
