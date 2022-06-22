function sellTokens(uint amountTokens) public {
    balance[msg.sender] = balance[msg.sender].sub(amountTokens);
    uint amountEther = amountTokens.mul(price).div(mult_dec);
    msg.sender.transfer(amountEther);
}
