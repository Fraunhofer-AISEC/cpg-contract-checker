uint256 stakeAmount = user.amount;
uint256 timeDiff;
unchecked {
    timeDiff = block.timestamp - user.initialTime;
}
if (timeDiff >= stakingDuration) {
    uint256 stakingDurationInNum = 30;
    return
        stakeAmount.mul(dailyReturnsInBPS).div(10000).mul(
            stakingDurationInNum
        );
}
uint256 returnsIn30days = dailyReturnsInBPS * 30;
uint256 rewardAmount = (((stakeAmount * returnsIn30days) / 10000) *
    timeDiff) / stakingDuration;
pendingReward = rewardAmount;
