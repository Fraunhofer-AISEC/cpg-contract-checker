function swapWithReferral(
    IERC20 ,
    IERC20 ,
    uint256 amount,
    uint256 minReturn,
    uint256[] calldata distribution,
    uint256 flags,
    address referral,
    uint256 feePercent
) external makeGasDiscount(flags) returns(uint256 returnAmount) {
    ...
    _fromToken(msg.sender).transferFrom(address(this), amount); 
    ...
    _destToken(msg.sender).transfer(msg.sender, returnAmount);  
    ...
}
