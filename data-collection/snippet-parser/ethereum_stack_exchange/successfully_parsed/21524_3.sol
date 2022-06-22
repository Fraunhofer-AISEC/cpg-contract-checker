function getEthBalance(address _addr) constant returns(uint) {
    return _addr.balance;
}
