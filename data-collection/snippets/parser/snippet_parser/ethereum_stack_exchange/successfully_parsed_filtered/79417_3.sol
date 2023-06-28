mapping(address => uint) private processedBalances;
mapping(address => uint) private unprocessedDeposits;
mapping(address => uint) private unprocessedWithdrawals;

function balanceOf(address user) public view returns(uint) {
   return processedBalances[user] + unprocessedDeposits[user] - unprocessedWithdrawals[user];
}
