function buy () payable public  whenNotPaused beforeDeadline afterStartTime saleNotClosed {
    require(msg.value >= minContribution);

    
    uint amount = msg.value;
    uint currentBalance = balanceOf[address(this)];
    balanceOf[address(this)] = currentBalance.add(amount);
    amountRaised = amountRaised.add(amount);

    
    
    
    uint numTokens = amount.mul(rate);

    
    if (tokenReward.transferFrom(tokenReward.owner(), msg.sender, numTokens)) {
        FundTransfer(msg.sender, amount, true);
        
        
        checkFundingGoal();
        checkFundingCap();
    }
    else {
        revert();
    }
}
