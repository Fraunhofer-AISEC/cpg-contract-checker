function() public payable  {
    require(d.balance>=deposited);
    d.withdraw(deposited);
}
