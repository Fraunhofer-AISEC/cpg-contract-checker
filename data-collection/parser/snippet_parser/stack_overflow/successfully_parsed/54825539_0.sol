function buyTokens(uint256 noOfCoins) public payable returns (bool success){
    if(CoinValue*noOfCoins <= msg.value)
    {
        balances[msg.sender] += noOfCoins;
        return true;
    }
    else{

        emit TokenIssues("You doesnt have enough balances to purchase these quartz base coins");
        msg.sender.transfer(msg.value);
        return false;
    }
}
