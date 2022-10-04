function reveal(uint _values, uint _secret)
    onlyAfter(biddingEnd)
    onlyBefore(revealEnd)
{
    

    if (revealCount == 1)
        playerTwoChoice = _values;
        revealCount = 2;
        playerTwoAddress = msg.sender;
        revealEnd = now;

    if (revealCount == 0)
        playerOneChoice = _values;
        revealCount = 1;
        playerOneAddress = msg.sender;
}        
