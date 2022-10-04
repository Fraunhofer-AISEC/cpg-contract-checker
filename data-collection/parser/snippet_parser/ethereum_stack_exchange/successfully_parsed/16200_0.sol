function () payable {
        PayableCalled(true)   
        if (crowdsaleClosed) throw;
        uint amount = msg.value;
        balanceOf[msg.sender] = amount;
        amountRaised += amount;
        Transaction(msg.sender,msg.value,amountRaised)
        tokenReward.transfer(msg.sender, amount / price);
        FundTransfer(msg.sender, amount, true);
    }
