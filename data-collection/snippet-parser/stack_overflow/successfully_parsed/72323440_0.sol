constructor(address stakingToken, address rewardsToken, uint256 timeConstant) {
        s_stakingToken = IERC20(stakingToken);
        s_rewardsToken = IERC20(rewardsToken);
        initialTime = block.timestamp;
        T = timeConstant;
    }
