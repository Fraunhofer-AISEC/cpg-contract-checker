function approveERC20Spender(address token, address spender, uint amount) external onlyOwner {
  
  ERC20(token).safeApprove(spender, amount);
}
