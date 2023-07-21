function getDeposit(address user) public view returns (uint) {
    return balances[user].Deposit;
}
