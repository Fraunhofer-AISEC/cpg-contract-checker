function sendTokens () public payable returns (uint)
    {
       
        AppleToken appleToken;
        appleToken = AppleToken(tokenAddress);
        appleToken.transfer(msg.sender, 10);
        return appleToken.balanceOf(msg.sender);
    }
