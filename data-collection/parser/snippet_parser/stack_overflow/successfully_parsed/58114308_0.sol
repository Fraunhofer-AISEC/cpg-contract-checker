function getFunds(address addr, uint amount) public {
    require (address.this(balance)>= amount);
    addr.transfer(amount);
}
