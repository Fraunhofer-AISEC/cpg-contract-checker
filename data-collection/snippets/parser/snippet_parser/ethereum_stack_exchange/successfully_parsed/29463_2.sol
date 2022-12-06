function queryBalance(address addr) public constant returns (uint balance) {
    return addr.balance;
}
