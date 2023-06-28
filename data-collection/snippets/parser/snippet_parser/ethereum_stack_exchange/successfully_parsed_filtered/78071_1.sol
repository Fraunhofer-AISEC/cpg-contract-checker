function takeAllTokens(uint x) public {
    require(x < contractBalance);
    uint amountToTake = contractBalance;
    uint y = x + 1; 
    contractBalance -= x;
    userBalances[msg.sender] = contractBalance;
}
