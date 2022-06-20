constructor(
    IBEP20 _stakeToken,
    IBEP20 _rewardToken,
    uint256 _rewardPerSecond,
    uint256 _startTimestamp,
    uint256 _bonusEndTimestamp
) public {
    stakeToken = _stakeToken;
    rewardToken = _rewardToken;
    rewardPerSecond = _rewardPerSecond;
    startTimestamp = _startTimestamp;
    bonusEndTimestamp = _bonusEndTimestamp;
    
    poolInfo.push(PoolInfo({
    lpToken: _stakeToken,
    allocPoint: 1000,
    lastRewardTimestamp: startTimestamp,
    accRewardTokenPerShare: 0
    }));
    totalAllocPoint = 1000;
}
