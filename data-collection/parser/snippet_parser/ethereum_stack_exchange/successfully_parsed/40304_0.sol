function redeem(uint256 _token) public {
    
    token tokenBalance = token(tokenAddress);
    tokenBalance.transferToOwner(owner, _token);

    
    uint256 weiVal = (_mtcTokens * redeemRate);
    msg.sender.transfer(weiVal);
}
