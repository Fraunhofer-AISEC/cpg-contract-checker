  mapping(address => uint256) allowance;

  ...

  function setAllowance(address user, uint256 amount) external onlyOwner nonReentrant returns (uint256) {
    allowance[user] = amount;
    emit AllowanceLimitChange(user, amount, ChangeType.None, allowance[user]);
    return allowance[user];
  }
