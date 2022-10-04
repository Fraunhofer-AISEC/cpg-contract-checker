function sellToken(uint256 amount) public returns (bool){
    require(amount > 0, "You should sell some tokens");
    require(balance[msg.sender] >= amount, "You should have enough amount of tokens to sell");
    balance[msg.sender] -= amount;
    uint256 refund = amount * tokenPrice;
    payable(msg.sender).transfer(refund);
    emit Sell(msg.sender, amount);
    return true;
}
