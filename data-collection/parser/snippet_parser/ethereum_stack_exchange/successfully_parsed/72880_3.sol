function viewBalance() public view returns (uint) {
    return balances[msg.sender];
}
