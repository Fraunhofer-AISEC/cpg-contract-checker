function getTransaction(uint256 idx) external returns(Transaction memory) {
    return transactions[idx];
}
