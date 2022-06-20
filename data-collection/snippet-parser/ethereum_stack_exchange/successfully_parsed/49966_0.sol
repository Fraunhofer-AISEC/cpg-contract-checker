function buy ()
        payable public
        whenNotPaused
        beforeDeadline
        afterStartTime
        saleNotClosed
    {
        require(msg.value >= minContribution);
        uint amount = msg.value;

        
        
        
        uint numTokens = amount.mul(rate);

        

        require(tokenReward.transfer(msg.sender, numTokens));

        

        
        amountRaised = amountRaised.add(amount);

        
        balanceOf[msg.sender] = balanceOf[msg.sender].add(amount);
        
        tokenBalanceOf[msg.sender] = tokenBalanceOf[msg.sender].add(numTokens);

        FundTransfer(msg.sender, amount, true);
        
        checkFundingGoal();
        checkFundingCap();
    }
