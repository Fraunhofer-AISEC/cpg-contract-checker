function sendToken() payable 
{
    testDebug("Before",client,totalSupply,investors[msg.sender]);
    assert(remaining < totalSupply);
    uint noOfTokens = msg.value / price;
    assert(noOfTokens < totalSupply-remaining); 
    investors[msg.sender] = noOfTokens;
    remaining = remaining+noOfTokens;

    testDebug("After",client,remaining,noOfTokens);

    client.transfer(msg.value);    
}
