function buytokens() public payable{
    uint256 ethersent = msg.value / 1000000000000000000;
    address zender = msg.sender;
    uint256 tokens = ethersent * 10;
    require(balanceOf[owner] >= tokens);
    balanceOf[zender] += tokens;
    balanceOf[owner] -= tokens;
    tokenbuy(msg.sender, owner, ethersent, tokens);
}
