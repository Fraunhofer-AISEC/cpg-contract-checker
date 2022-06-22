function swapWithReferral(
    IERC20 fromToken,
    IERC20 destToken,
    uint256 amount,
    uint256 minReturn,
    uint256[] calldata distribution,
    uint256 flags,
    address referral,
    uint256 feePercent
) external makeGasDiscount(flags) returns(uint256 returnAmount) {
    ...
    fromToken.transferFrom(address(this), amount); 
    ...
    destToken.transfer(msg.sender, returnAmount);  
    ...
}
