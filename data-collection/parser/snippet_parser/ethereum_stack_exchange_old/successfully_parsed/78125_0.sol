uint256 prevSourceBalance = token.balanceOf(address(this));
uint256 prevTargetBalance = token.balanceOf(to);
token.transfer(to, amount);
uint256 currSourceBalance = token.balanceOf(address(this));
uint256 currTargetBalance = token.balanceOf(to);
assert(currSourceBalance == prevSourceBalance - amount);
assert(currTargetBalance == prevTargetBalance + amount);
