function sellTokens(uint256 _numberOfTokens) public {

    require(tokenContract.transferFrom(msg.sender,this, _numberOfTokens));

    tokensSold -= _numberOfTokens;

    uint amountToSend = multiply(_numberOfTokens, tokenPrice);

    msg.sender.transfer(amountToSend);

    emit Sell(msg.sender, amountToSend);
}
