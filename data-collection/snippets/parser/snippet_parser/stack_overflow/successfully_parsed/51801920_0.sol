function fund(uint _dbIndex, uint _fundedAmount) public {
    uint totalAmount = projectWallets[_dbIndex].fundedAmount;
    totalAmount += _fundedAmount;
    projectWallets[_dbIndex].fundedAmount = totalAmount;
}
