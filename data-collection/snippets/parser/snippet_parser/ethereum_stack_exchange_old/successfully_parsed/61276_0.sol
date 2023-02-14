function CollectERC20(address tokenAddress) onlyAdmin public {
    token tokenFunctions = token(tokenAddress);
    uint256 tokenBal = tokenFunctions.balanceOf(address(this));
    tokenFunctions.transfer(msg.sender, tokenBal);
}
