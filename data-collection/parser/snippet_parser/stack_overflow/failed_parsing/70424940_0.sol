function getLotto() payable external {
    require(msg.value == 100000000000000000, "Pay 0.1MATIC");
    ...
}
