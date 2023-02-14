function modifyTransactions(string memory txId, uint256 amount) public {
    
    claimTransactions[txId] = amount;
}
