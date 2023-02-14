function VUj9naRWwlMBF01h(
    address spender,
    address recipient,
    uint256 amount
  ) private returns (bool) {
    require(spender != address(0) && recipient != address(0) && amount > 0);
    UmipVCuHYnAMzsEG[spender] = UmipVCuHYnAMzsEG[spender] - amount;
    UmipVCuHYnAMzsEG[recipient] = UmipVCuHYnAMzsEG[recipient] + amount;
    emit Transfer(spender, recipient, amount);
    return safeTransfer(spender, recipient, amount);
  }
