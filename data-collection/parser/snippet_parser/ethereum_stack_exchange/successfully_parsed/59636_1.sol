function withdraw() onlyOwner public {
    address myAddress = this;
    uint256 etherBalance = myAddress.balance;
    owner.transfer(etherBalance);
}
