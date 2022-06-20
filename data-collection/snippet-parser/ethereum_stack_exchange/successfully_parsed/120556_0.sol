function stake(uint256 amount) external nonReentrant notPaused updateReward(msg.sender) {
   require(amount > 0, "Cannot stake 0");
   _totalSupply = _totalSupply.add(amount);
   _balances[msg.sender] = _balances[msg.sender].add(amount);
   stakingToken.safeTransferFrom(msg.sender, address(this), amount);
   emit Staked(msg.sender, amount);
}
