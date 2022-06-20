function claimTokens() public {
    require(finalized, "Presale is not finalized yet!");
 
    uint256 amount_ = tokenAllocation(msg.sender);
    IERC20(tokenAddress).approve(address(this), amount_);
    IERC20(tokenAddress).transferFrom(address(this), msg.sender, amount_);
}
