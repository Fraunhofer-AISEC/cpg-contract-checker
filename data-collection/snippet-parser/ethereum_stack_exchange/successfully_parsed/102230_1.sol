function bill() public returns (uint) {
    uint bill=price*balances[receiver];
    return bill;
}
