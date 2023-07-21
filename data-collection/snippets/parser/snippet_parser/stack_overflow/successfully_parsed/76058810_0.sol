struct StakerData {
        uint256 totalStaked;
        uint256 lastStakedTimestamp;
        uint256 reward;
    }

mapping(address => StakerData) public stakers;

function calculateReward(address user) public view returns (uint256) {
        StakerData storage staker = stakers[user];
        uint256 stakingDuration = block.timestamp.sub(staker.lastStakedTimestamp);
        uint256 calculatedRewards = staker.totalStaked.mul(rewardRate).mul(stakingDuration).div(1e18);
        return calculatedRewards;
    }
