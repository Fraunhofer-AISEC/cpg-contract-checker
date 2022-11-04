function getDepositedAmount() public view returns (uint){ 
    uint price = getPrice();
    uint precision = 1 * 10**18;
    return((MINIMUM_DEPOSIT * precision) / price);
}
