function getEthBalance(address _addr) constant public returns(uint) {
      return _addr.balance;
}
