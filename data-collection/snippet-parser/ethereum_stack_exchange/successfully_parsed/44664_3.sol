function sendTokens () public payable returns (uint)
    {
        AppleToken appleToken = AppleToken(tokenAddress);
        require(appleToken.transfer(msg.sender, 10));
        return appleToken.balanceOf(msg.sender);
    }
