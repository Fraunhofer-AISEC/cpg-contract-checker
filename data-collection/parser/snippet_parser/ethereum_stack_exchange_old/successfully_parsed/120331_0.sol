  function setAllowance(address tokenAddr, uint256 amount) external payable {
    IERC20(tokenAddr).safeIncreaseAllowance(address(this), amount * 10**18);
  }

  function getAllowance(address tokenAddr) external view returns (uint256) {
    return IERC20(tokenAddr).allowance(msg.sender, address(this)) / 10**18;
  }
