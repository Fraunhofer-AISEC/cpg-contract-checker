function getBalance() public view returns (uint) {
    return balances[msg.sender];
}
