function buyTokens(uint256 _numberOfTokens) public payable {

    
    require(msg.value == multiply(_numberOfTokens, tokenPrice));

    
    require(tokenContract.balanceOf(this) >= _numberOfTokens);

    
    require(tokenContract.transfer(msg.sender, _numberOfTokens));

    
    tokensSold += _numberOfTokens;

    
    emit Sell(msg.sender, _numberOfTokens);
}

function sellTokens(uint256 _numberOfTokens) public payable {

    
    require(msg.value == multiply(_numberOfTokens, tokenPrice));

    require(tokenContract.transferFrom(msg.sender,this, _numberOfTokens));

    tokensSold -= _numberOfTokens;

    uint amountEther = multiply(_numberOfTokens, tokenPrice)/(10**18);

    uint amountEtherToSend = address(this).balance - amountEther;

    msg.sender.transfer(amountEtherToSend);

    emit Sell(msg.sender, amountEther);
}
