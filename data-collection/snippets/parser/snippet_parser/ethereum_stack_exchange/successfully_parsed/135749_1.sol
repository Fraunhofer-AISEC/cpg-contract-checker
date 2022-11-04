mapping(address => AllUserStakedTimestamp) internal allUserStakes;

struct AllUserStakedTimestamp {
    bool[] _wasUnstaked;
    bool[] _autoRenewal;
    uint[] _amountStaked;
    uint[] _timeOfStake;
    uint[] _timesOfRelease;
    uint[] _optionReleaseSelected; 
    uint[] _epochDuration;
    uint[] _rewardPerCycle;
    uint[] _finalStakeReward;
}

function getUsersStakes(address user) external view returns (AllUserStakedTimestamp memory) {
    return allUserStakes[user];
}
