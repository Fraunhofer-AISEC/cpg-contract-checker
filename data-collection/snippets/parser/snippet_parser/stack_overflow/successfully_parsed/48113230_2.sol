function() public payable {
    uint toMint = msg.value/price;
    totalSupply += toMint;
    balances[msg.sender] += toMint;

    emit Transfer(0, msg.sender, toMint);
}
