function stake(uint256 amount) external updateReward(_msgSender()) {
    require(amount > 0, "Cannot stake 0");
    totalStakeAmount = totalStakeAmount.add(amount);
    User storage _user = userInfo[_msgSender()];
    _user.stakeAmount = _user.stakeAmount.add(amount);
    emit Staked(_msgSender(), amount);
}

function unstake(uint256 amount) public updateReward(_msgSender()) {
    require(amount > 0, "Cannot withdraw 0");
    User storage _user = userInfo[_msgSender()];
    totalStakeAmount = totalStakeAmount.sub(amount);
    _user.stakeAmount = _user.stakeAmount.sub(amount);
    IERC20(stakeToken).safeTransfer(_msgSender(), amount);
    emit Unstaked(_msgSender(), amount);
}
