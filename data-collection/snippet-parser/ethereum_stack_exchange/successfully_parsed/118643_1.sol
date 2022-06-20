    function () payable {
        if (crowdsaleClosed) throw;
        uint amount = msg.value;
        
        balanceOf[msg.sender] = amount;
        
        amountRaised += amount;
        tokenReward.transfer(msg.sender, amount / price);
        FundTransfer(msg.sender, amount, true);
    }
