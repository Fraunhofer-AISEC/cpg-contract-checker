function getFunds(address payable addr, uint amount) public {
    require (address.this(balance)>= amount);
    addr.transfer(amount);
}
