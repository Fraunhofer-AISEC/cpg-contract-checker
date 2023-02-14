function notifyRewardAmount(uint256 reward) external onlyRewardsDistribution updateReward(address(0)) {
    if (block.timestamp >= periodFinish) {
        rewardRate = reward.div(rewardsDuration);
    } else {
        uint256 remaining = periodFinish.sub(block.timestamp);
        uint256 leftover = remaining.mul(rewardRate);
        rewardRate = reward.add(leftover).div(rewardsDuration);
    }

    
    
    
    
    uint balance = rewardsToken.balanceOf(address(this));
    require(rewardRate <= balance.div(rewardsDuration), "Provided reward too high");

    lastUpdateTime = block.timestamp;
    periodFinish = block.timestamp.add(rewardsDuration);
    emit RewardAdded(reward);
}
