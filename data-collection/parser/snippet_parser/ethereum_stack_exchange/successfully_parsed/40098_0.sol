function tradeBalances(address tokenGet, uint amountGet, address tokenGive, uint amountGive, address user, uint amount) private {
  uint feeTakeXfer = safeMul(amount, feeTake) / (1 ether);
  tokens[tokenGet][msg.sender] = safeSub(tokens[tokenGet][msg.sender], safeAdd(amount, feeTakeXfer));
  tokens[tokenGet][user] = safeAdd(tokens[tokenGet][user], amount);
  tokens[tokenGet][feeAccount] = safeAdd(tokens[tokenGet][feeAccount], feeTakeXfer);
  tokens[tokenGive][user] = safeSub(tokens[tokenGive][user], safeMul(amountGive, amount) / amountGet);
  tokens[tokenGive][msg.sender] = safeAdd(tokens[tokenGive][msg.sender], safeMul(amountGive, amount) / amountGet);
}
