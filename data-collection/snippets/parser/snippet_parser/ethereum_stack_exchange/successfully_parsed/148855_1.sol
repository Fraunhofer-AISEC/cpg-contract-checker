function attemptTransfer(IERC20 token, address origin, address beneficiary, uint256 amount) external {
    require(msg.sender == address(this));  
    token.safeTransferFrom(origin, beneficiary, amount);
}
