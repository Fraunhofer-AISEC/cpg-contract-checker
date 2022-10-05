function claimRewards()  public {
    uint96 balance = balanceOf(msg.sender);
    require(balance > 0);
    _pendingBalance[msg.sender] = 0;
    token.transfer(msg.sender, balance);
    emit ClaimRewards(msg.sender, balance);
  }
