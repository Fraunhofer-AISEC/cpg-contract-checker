modifier updateReward(address account) {
    rewardPerTokenStored = rewardPerToken();
    lastUpdateTime = block.timestamp;

    rewards[account] = earned(account);
    userRewardPerTokenPaid[account] = rewardPerTokenStored;
    _;
}

function stake(uint _amount) external updateReward(msg.sender) {
    _totalSupply += _amount;
    _balances[msg.sender] += _amount;
    stakingToken.transferFrom(msg.sender, address(this), _amount);
}

function withdraw(uint _amount) external updateReward(msg.sender) {
    _totalSupply -= _amount;
    _balances[msg.sender] -= _amount;
    stakingToken.transfer(msg.sender, _amount);
}

function getReward() external updateReward(msg.sender) {
    uint reward = rewards[msg.sender];
    rewards[msg.sender] = 0;
    rewardsToken.transfer(msg.sender, reward);
}
