function sellBack(uint tokensSelling) external{
    require(balanceOf[msg.sender] >= tokensSelling);
    uint totalTokensPrice = tokensSelling * tokenPrice;
    balanceOf[msg.sender] -= tokensSelling;
    balanceOf[owner] += tokensSelling;
    msg.sender.transfer(totalTokensPrice);
}
